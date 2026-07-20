return {
  'numToStr/Comment.nvim',
  config = function()
    local ft = require('Comment.ft')
    ft.set('make', '# %s')
  end,
}
