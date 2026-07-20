vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
local opt = { noremap = true, silent = true }

map('v', '<C-y>', '"+y', opt)
map('n', '<C-s>', 'viw', opt)
map('n', '<Leader>q', ':bdelete %<CR>', opt)
map('n', '\\', ':nohls<CR>', opt)
