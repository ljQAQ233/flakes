local function telescope_with_filter(func)
  local submodule_paths = require('mylib.git').get_submodules()
  local opts_val = {}
  if #submodule_paths > 0 then
    local config = require('telescope.config').values
    local global_ignores = config.file_ignore_patterns or {}
    opts_val.file_ignore_patterns =
      vim.list_extend(vim.deepcopy(submodule_paths), global_ignores)
  end
  func(opts_val)
end

local bchars = {
  prompt = {
    ' ',
    ' ',
    '─',
    '│',
    '│',
    ' ',
    '─',
    '└',
  },
  results = {
    '─',
    ' ',
    ' ',
    '│',
    '┌',
    '─',
    ' ',
    '│',
  },
  preview = {
    '─',
    '│',
    '─',
    '│',
    '┬',
    '┐',
    '┘',
    '┴',
  },
}

local bchars_full = {
  '─',
  '│',
  '─',
  '│',
  '┌',
  '┐',
  '┘',
  '└',
}

return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<Leader>b', ':Telescope buffers<CR>' },
    {
      '<leader>p',
      function()
        telescope_with_filter(require('telescope.builtin').fd)
      end,
    },
    {
      '<leader>[',
      function()
        telescope_with_filter(require('telescope.builtin').live_grep)
      end,
    },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = {
          'node_modules',
        },
        border = true,
        borderchars = bchars,
      },
      extensions = {
        persisted = {
          layout_config = { width = 0.6, height = 0.8 },
          borderchars = bchars_full,
        },
      },
    })
    require('telescope').load_extension('coc')
  end,
}
