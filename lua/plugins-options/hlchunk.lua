return {
  chunk = {
    enable = true,
    use_treesitter = true,
    notify = false, -- notify if some situation(like disable chunk mod double time)
    exclude_filetypes = {
      aerial = true,
      dashboard = true,
    },
    support_filetypes = {
      "*.lua",
      "*.js",
      "*.tsx",
      "*.jsx",
    },
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
      right_arrow = ">",
    },
    style = "#00ffff",
  },

  indent = {
    enable = true,
    use_treesitter = false,
    chars = {
      "│",
      "¦",
      "┆",
      "┊",
    },
    style = {
      "#48334e",

    },
  },

  line_num = {
    enable = false,
    use_treesitter = false,
    style = "#806d9c",
  },

  blank = {
    enable = true,
    chars = {
      "․",
    },
    style = {
      "#20352a",
    },
  },
}
