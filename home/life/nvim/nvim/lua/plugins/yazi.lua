return {
  'mikavilpas/yazi.nvim',
  keys = {
    {
      '<leader>y',
      function()
        require('yazi').yazi()
      end,
      desc = 'Open yazi',
    },
  },
  config = function() end,
}
