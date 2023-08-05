return {
	open_browser_app = "open", -- specify your browser app; default for macos is "open" and for linux "xdg-open"
	handlers = {
		plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
		github = true, -- open github issues
		package_json = true, -- open dependencies from package.json
	},
}
