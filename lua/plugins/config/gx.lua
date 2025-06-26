local M = {}

M.opts={
    handlers = {
        github = true, -- open github issues
        brewfile = false, -- open Homebrew formulaes and casks
        package_json = true, -- open dependencies from package.json
        search = true, -- search the web/selection on the web if nothing else is found
    },
    handler_options = {
        search_engine = "google", -- you can select between google, bing, duckduckgo, and ecosia
    },
}

return M
