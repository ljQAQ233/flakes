return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  keys = {
    { '<leader>e', ':NvimTreeToggle<CR>' },
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup({
      sync_root_with_cwd = true,
      actions = {
        change_dir = {
          enable = true,
          global = true,
        },
      },
    })
  end,
}
