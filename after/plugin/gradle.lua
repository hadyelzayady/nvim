local ok, mod = pcall(require, "gradle")

if ok and mod.setup then
	mod.setup({
		gradle_executable = "./gradlew",
	})
end
