return {
	{
		"roobert/search-replace.nvim",
		config = function()
			require("search-replace").setup({
				-- optionally override defaults
				default_replace_single_buffer_options = "gcI",
				default_replace_multi_buffer_options = "egcI",
			})
			-- show the effects of a search / replace in a live preview window
			vim.o.inccommand = "split"

			require("config.keymaps").search_replace_setup()
		end,
	},
	{
		"windwp/nvim-spectre",
    -- stylua: ignore
    keys = {
      {
        "<leader>sRR",
        function() require("spectre").open_visual() end,
        desc =
        "Replace in files (Spectre)"
      },
      {
        "<leader>sRw",
        function() require("spectre").open_visual({ select_word = true }) end,
        desc =
        "Replace current word in files (Spectre)"
      },
    },
		opts = {
			color_devicons = true,
			open_cmd = "vnew",
			live_update = true, -- auto excute search again when you write any file in vim
			line_sep_start = "┌-----------------------------------------",
			result_padding = "¦  ",
			line_sep = "└-----------------------------------------",
			highlight = {
				ui = "String",
				search = "DiffChange",
				replace = "DiffDelete",
			},
			mapping = {
				["toggle_line"] = {
					map = "dd",
					cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
					desc = "toggle current item",
				},
				["enter_file"] = {
					map = "<cr>",
					cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
					desc = "goto current file",
				},
				["send_to_qf"] = {
					map = "<leader>q",
					cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
					desc = "send all item to quickfix",
				},
				["replace_cmd"] = {
					map = "<leader>c",
					cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
					desc = "input replace vim command",
				},
				["show_option_menu"] = {
					map = "<leader>o",
					cmd = "<cmd>lua require('spectre').show_options()<CR>",
					desc = "show option",
				},
				["run_current_replace"] = {
					map = "<leader>rc",
					cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
					desc = "replace current line",
				},
				["run_replace"] = {
					map = "<leader>R",
					cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
					desc = "replace all",
				},
				["change_view_mode"] = {
					map = "<leader>v",
					cmd = "<cmd>lua require('spectre').change_view()<CR>",
					desc = "change result view mode",
				},
				["change_replace_sed"] = {
					map = "trs",
					cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
					desc = "use sed to replace",
				},
				["change_replace_oxi"] = {
					map = "tro",
					cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
					desc = "use oxi to replace",
				},
				["toggle_live_update"] = {
					map = "tu",
					cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
					desc = "update change when vim write file.",
				},
				["toggle_ignore_case"] = {
					map = "ti",
					cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
					desc = "toggle ignore case",
				},
				["toggle_ignore_hidden"] = {
					map = "th",
					cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
					desc = "toggle search hidden",
				},
				["resume_last_search"] = {
					map = "<leader>l",
					cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
					desc = "resume last search before close",
				},
				-- you can put your mapping here it only use normal mode
			},
			find_engine = {
				-- rg is map with finder_cmd
				["rg"] = {
					cmd = "rg",
					-- default args
					args = {
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
					},
					options = {
						["ignore-case"] = {
							value = "--ignore-case",
							icon = "[I]",
							desc = "ignore case",
						},
						["hidden"] = {
							value = "--hidden",
							desc = "hidden file",
							icon = "[H]",
						},
						-- you can put any rg search option you want here it can toggle with
						-- show_option function
					},
				},
				["ag"] = {
					cmd = "ag",
					args = {
						"--vimgrep",
						"-s",
					},
					options = {
						["ignore-case"] = {
							value = "-i",
							icon = "[I]",
							desc = "ignore case",
						},
						["hidden"] = {
							value = "--hidden",
							desc = "hidden file",
							icon = "[H]",
						},
					},
				},
			},
			replace_engine = {
				["sed"] = {
					cmd = "sed",
					args = nil,
					options = {
						["ignore-case"] = {
							value = "--ignore-case",
							icon = "[I]",
							desc = "ignore case",
						},
					},
				},
				-- call rust code by nvim-oxi to replace
				["oxi"] = {
					cmd = "oxi",
					args = {},
					options = {
						["ignore-case"] = {
							value = "i",
							icon = "[I]",
							desc = "ignore case",
						},
					},
				},
			},

			default = {
				find = {
					--pick one of item in find_engine
					cmd = "rg",
					options = { "ignore-case" },
				},
				replace = {
					--pick one of item in replace_engine
					cmd = "sed",
				},
			},
			replace_vim_cmd = "cdo",
			is_open_target_win = true, --open file on opener window
			is_insert_mode = false, -- start open panel on is_insert_mode
		},
	},
	{
		"AckslD/muren.nvim",
		cmd = { "MurenClose", "MurenFresh", "MurenToggle", "MurenOpen", "MurenUnique" },
		opts = {
			{
				-- general
				create_commands = true,
				filetype_in_preview = true,
				-- default togglable options
				two_step = false,
				all_on_line = true,
				preview = true,
				cwd = false,
				files = "**/*",
				-- keymaps
				keys = {
					close = "q",
					toggle_side = "<Tab>",
					toggle_options_focus = "<C-s>",
					toggle_option_under_cursor = "<CR>",
					scroll_preview_up = "<Up>",
					scroll_preview_down = "<Down>",
					do_replace = "<CR>",
					-- NOTE these are not guaranteed to work, what they do is just apply `:normal! u` vs :normal! <C-r>`
					-- on the last affected buffers so if you do some edit in these buffers in the meantime it won't do the correct thing
					do_undo = "<localleader>u",
					do_redo = "<localleader>r",
				},
				-- ui sizes
				patterns_width = 30,
				patterns_height = 10,
				options_width = 20,
				preview_height = 12,
				-- window positions
				anchor = "center", -- Set to one of:
				-- 'center' | 'top' | 'bottom' | 'left' | 'right' | 'top_left' | 'top_right' | 'bottom_left' | 'bottom_right'
				vertical_offset = 0, -- offsets are relative to anchors
				horizontal_offset = 0,
				-- options order in ui
				order = {
					"buffer",
					"dir",
					"files",
					"two_step",
					"all_on_line",
					"preview",
				},
				-- highlights used for options ui
				hl = {
					options = {
						on = "@string",
						off = "@variable.builtin",
					},
					preview = {
						cwd = {
							path = "Comment",
							lnum = "Number",
						},
					},
				},
			},
		},
	},
	{
		"eugen0329/vim-esearch",
		enabled = false,
	},
}
