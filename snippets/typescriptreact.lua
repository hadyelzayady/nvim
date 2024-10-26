local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local l = require("luasnip.extras").lambda

local snippets = {
  ls.parser.parse_snippet("lmmm", "local M = {}\n\nfunction M.setup()\n  $1 \nend\n\nreturn M"),
}
return snippets
