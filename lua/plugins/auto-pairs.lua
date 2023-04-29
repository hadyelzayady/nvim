return {
  {
    "windwp/nvim-autopairs",
    config = function()
      local npairs = require('nvim-autopairs')
      npairs.setup({
        disable_filetype = { "TelescopePrompt" },
        disable_in_macro = false,             -- disable when recording or executing a macro
        disable_in_visualblock = false,       -- disable when insert after visual block mode
        ignored_next_char = [=[[%w%%%'%[%"%.]]=],
        enable_moveright = true,
        enable_afterquote = true,               -- add bracket pairs after quote
        enable_check_bracket_line = true,       --- check bracket in same line
        enable_bracket_in_quote = true,         --
        check_ts = false,
        map_bs = true,
        map_cr = true
      })
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  }
}
