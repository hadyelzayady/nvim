vim.filetype.add({
	pattern = {
		[".env.*"] = "bash",
		["compose.yaml"] = "yaml.docker-compose",
	},
})
