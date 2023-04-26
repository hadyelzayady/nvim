return {
    {
        "phaazon/hop.nvim",
        branch = 'v2', -- optional but strongly recommended
        opts = {
            keys = 'etovxqpdygfblzhckisuran',
        },
        config = function(_, opts)
          local hop = require('hop')
          hop.setup(opts)
          local directions = require('hop.hint').HintDirection
          vim.keymap.set('', 'f', function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
          end, { remap = true })
          vim.keymap.set('', 'F', function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
          end, { remap = true })
          vim.keymap.set('', 't', function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
          end, { remap = true })
          vim.keymap.set('', 'T', function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
          end, { remap = true })
        end
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        keys = {
            { "<leader>ja", function() require("harpoon.mark").add_file() end,        desc = "Add File" },
            { "<leader>jm", function() require("harpoon.ui").toggle_quick_menu() end, desc = "File Menu" },
            { "<leader>1",  function() require("harpoon.ui").nav_file(1) end,         desc = "File 1" },
            { "<leader>2",  function() require("harpoon.ui").nav_file(2) end,         desc = "File 2" },
        },
        opts = {
            global_settings = {
                save_on_toggle = true,
                enter_on_sendcmd = true,
            },
        },
    },
    {
        -- better word navigation
        -- CamelCaseACRONYMWords_underscore1234
        -- w --------------------------------->w
        -- e --------------------------------->e
        -- b < ---------------------------------b
        --  bu with this plugin
        -- CamelCaseACRONYMWords_underscore1234
        -- w--->w-->w----->w---->w-------->w->w
        -- e-->e-->e----->e--->e--------->e-->e
        -- b<---b<--b<-----b<----b<--------b<-b
        "chaoren/vim-wordmotion"
    }
}
