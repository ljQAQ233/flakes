local font_size = 10
local gui_font =
  'JetBrainsMono Nerd Font Mono:style=ExtraLight,Regular'

local guifont_adjust = function(offset)
  font_size = font_size + offset
  if font_size <= 0 then
    font_size = 1
  end
  vim.o.guifont = gui_font .. ':h' .. font_size
end

-- default
guifont_adjust(0)

-- keybindings
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-PageUp>', function()
  guifont_adjust(1)
end)

vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-PageDown>', function()
  guifont_adjust(-1)
end)

vim.keymap.set('n', '<C-S-v>', ':put +')
vim.keymap.set('i', '<C-S-v>', '<C-r>+')
vim.keymap.set('c', '<C-S-v>', '<C-r>+')
