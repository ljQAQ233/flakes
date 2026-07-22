return {
  -- dir = '/home/maouai233/proj/emoji.nvim',
  'allaman/emoji.nvim',
  lazy = false,
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {},
  config = function(_, opts)
    require('emoji').setup(opts)
    local ts = require('telescope').load_extension('emoji')
    vim.keymap.set(
      'n',
      '<leader>sk',
      ts.kaomoji,
      { desc = '[S]earch [K]aomoji' }
    )
  end,
}
