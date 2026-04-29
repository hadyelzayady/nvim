vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-mini/mini.clue" },
	{ src = "https://github.com/junegunn/fzf" },
	{ src = "https://github.com/kevinhwang91/nvim-bqf" },
	{ src = "https://github.com/stevearc/quicker.nvim" },
})
--======================== Mini Icons =================================
-- Set up to not prefer extension-based icon for some extensions
local ext3_blocklist = { scm = true, txt = true, yml = true }
local ext4_blocklist = { json = true, yaml = true }
require("mini.icons").setup({
	use_file_extension = function(ext, _)
		return not (ext3_blocklist[ext:sub(-3)] or ext4_blocklist[ext:sub(-4)])
	end,
})

-- Mock 'nvim-tree/nvim-web-devicons' for plugins without 'mini.icons' support.
-- Not needed for 'mini.nvim' or MiniMax, but might be useful for others.
MiniIcons.mock_nvim_web_devicons()

-- Add LSP kind icons. Useful for 'mini.completion'.
MiniIcons.tweak_lsp_kind()
