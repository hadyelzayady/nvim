function GitFileStatus()
  local file = vim.fn.expand('%:p') -- Get absolute file path
  if file == '' then return '' end
  local cmd = "git status --porcelain " .. vim.fn.shellescape(file)
  local status = vim.fn.system(cmd):sub(1, 2)

  local symbols = {
    [" M"] = " ",  -- Modified
    ["M "] = " ",  -- Staged
    ["??"] = " ",  -- Untracked
    [" D"] = " ",  -- Deleted
    ["A "] = " ",  -- Added
    [" R"] = " ",  -- Renamed
  }
  return symbols[status] or ''
end

function GitAheadBehind()
  local status = vim.fn.system('git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null')
  local ahead, behind = status:match('(%d+)%s+(%d+)')
  ahead, behind = tonumber(ahead), tonumber(behind)
  local result = ''
  if ahead and ahead > 0 then result = result .. '⇡ ' .. ahead .. ' ' end
  if behind and behind > 0 then result = result .. '⇣ ' .. behind end
  return result
end

function GitBranch()
    local branch= vim.fn.FugitiveHead()
    if branch then
      return '[ ' .. branch .. GitAheadBehind() ..']'
    end
  return  ""

end


vim.o.statusline = '%{v:lua.GitBranch()}%{v:lua.GitFileStatus()} %= %l:%c %p%%'
