return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup({
      highlight = {
        enable = true,
        disable = {
          'help',
        },
      },
      indent = {
        enable = false,
        disable = {},
      },
      ensure_installed = {
        'c',
        'mdx',
      },
    })
  end,
}
