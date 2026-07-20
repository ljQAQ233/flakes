return {
  'utilyre/barbecue.nvim',
  tag = 'v1.2.0',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('barbecue').setup({
      enabled = true,
      attach_navic = false,
      exclude_filetypes = {
        'vimspector-ui',
      },
    })
  end,
}
