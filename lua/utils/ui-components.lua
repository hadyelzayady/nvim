local M = {}

M.icons = {
  diagnostics = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  },
  git = {
    added = " ",
    modified = " ",
    removed = " ",
    renamed = "󰁕",
    -- Status type
    untracked = "",
    ignored = "",
    unstaged = "󰄱",
    staged = "",
    conflict = "",
  },
  folder = {
    opened = "",
    closed = "",
    empty = "",
  },
  file = {
    modified = "●",
  },
  kinds = {
    Array = " ",
    Boolean = " ",
    Class = " ",
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = "󰉋",
    Function = " ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = "󰟢",
    Number = " ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = " ",
    Copilot = "",
  },
  debug = {
    breakpoint = "",
    stackframe = "",
    breakpoint_condition = "",
    breakpoint_logpoint = "",
    stopped = "",
  },
  format={
	  formatter ="󰖷"
  }
}

return M
