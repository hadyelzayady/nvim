local M = {}

M.filename_to_key = {
	["Cargo.toml"] = "cargo_toml",
	["package.json"] = "package_json",
}

M.cargo_toml = {
	hide = function()
		vim.cmd("Crates hide")
	end,
	show = function()
		vim.cmd("Crates show")
	end,
	toggle = function()
		vim.cmd("Crates toggle")
	end,
	update = function()
		vim.cmd("Crates update")
	end,
	version = function()
		vim.cmd("Crates show_versions_popup")
	end,
}

M.package_json = {
	hide = function()
		require("package-info").hide()
	end,
	show = function()
		require("package-info").show()
	end,
	toggle = function()
		require("package-info").toggle()
	end,
	update = function()
		require("package-info").update()
	end,
	delete = function()
		require("package-info").delete()
	end,
	install = function()
		require("package-info").install()
	end,
	version = function()
		require("package-info").change_version()
	end,
}
return M
