local ls = require("luasnip")

local snippets = {
	ls.parser.parse_snippet("cj", "Content-Type: application/json"),
}
return snippets
