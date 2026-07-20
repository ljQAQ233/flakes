local M = {}

local cached_cwd = nil
local cache_submodules = nil

M.get_submodules = function()
  local cwd = vim.fn.getcwd()
  if vim.uv.fs_stat(cwd .. '/.git') == nil then
    return {}
  end
  if cache_submodules and cached_cwd == cwd then
    return cache_submodules
  end
  cache_submodules = (function()
    local handle =
      io.popen([[ git submodule foreach --quiet 'echo "$path"' ]])
    if not handle then
      return {}
    end
    local paths = {}
    for line in handle:lines() do
      line = line:gsub('\\$', '')
      if line ~= '' then
        if not line:match('/$') then
          line = line .. '/'
        end
        table.insert(paths, line)
      end
    end
    handle:close()
    return paths
  end)()
  cached_cwd = cwd
  return cache_submodules
end

M.refresh_cache = function()
  cached_cwd = nil
  cache_submodules = nil
end

return M
