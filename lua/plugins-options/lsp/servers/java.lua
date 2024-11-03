return function(setup_lsp)
	setup_lsp("jdtls", {
		settings = {
			java = {
				configuration = {
					runtimes = {
						{
							name = "JavaSE-21",
							path = "/Users/hadyelzayady/.sdkman/candidates/java/21.0.5-tem",
							default = true,
						},
					},
				},
			},
		},
	})
end
