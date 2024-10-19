return {
  {
    'saghen/blink.cmp',
    event = { "InsertEnter" },
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- On musl libc based systems you need to add this flag
    -- build = 'RUSTFLAGS="-C target-feature=-crt-static" cargo build --release',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        accept = '<Enter>'
      },
      highlight = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
      },
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'normal',

      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = true } },
      providers = {
        -- all of these properties work on every source
        {
          'blink.cmp.sources.lsp',
          name = 'LSP',
          keyword_length = 2,
        },
      },
      -- experimental signature help support
      trigger = { signature_help = { enabled = true } },
      windows = {
        documentation = {
          auto_show = true,
        }
      },
      kind_icons = require("utils.ui-components").kinds
    }
  }
}
