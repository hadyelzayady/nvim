local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local function get_file_basename()
  local file = vim.fn.expand("%:t:r") -- %:t:r gets the file's base name without extension
  return file or "Component"
end
local snippets = {
  ls.snippet("fc", fmt([[
interface Props{{}}
export function {}(props:Props){{
  return (
    <div>
    {}
    </div>
  );
}};

  ]], {
    ls.function_node(get_file_basename, {}),
    ls.insert_node(1)
  }))
}
return snippets
