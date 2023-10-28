local M = {}

function M.map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

function M.os_capture(cmd, raw)
  local handle = assert(io.popen(cmd, 'r'))
  local output = assert(handle:read('*a'))
  handle:close()
  if raw then
    return output
  end
  output = string.gsub(
    string.gsub(
      string.gsub(output, '^%s+', ''),
      '%s+$',
      ''
    ),
    '[\n\r]+',
    ' '
  )
  return output
end

function M.escape_path(arg)
  return vim.fn.shellescape(arg, true)
end

function M.get_current_buffer_file_path()
  return vim.api.nvim_buf_get_name(0)
end

return M
