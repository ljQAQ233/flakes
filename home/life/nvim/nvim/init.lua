-- Extend package path for local plugins
package.path = vim.fn.stdpath('config')
  .. '/lua/myplug/?.lua'
  .. ';'
  .. package.path

vim.opt.termguicolors = true

-- everforest
-- catppuccin
vim.g.mytheme = 'catppuccin'

vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup('CocGroup', {})
vim.api.nvim_create_autocmd('User', {
  group = 'CocGroup',
  pattern = 'CocJumpPlaceholder',
  command = "call CocActionAsync('showSignatureHelp')",
  desc = 'Update signature help on jump placeholder',
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('config')
require('keybind')

-- Setup lazy.nvim
require('lazy').setup('plugins', {
  defaults = {
    lazy = false,
  },
  install = { colorscheme = { 'catppuccin-nvim' } },
  change_detection = { notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        'matchit',
        'netrwPlugin',
        'tohtml',
        'tutor',
      },
    },
  },
})

if vim.g.neovide then
  require('neovide')
end

vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})
