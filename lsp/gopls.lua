local roots = {
	"go.mod",
}
return {
	cmd = { "gopls" },
	root_dir = require("utils.lsp").root_dir(roots),
}
