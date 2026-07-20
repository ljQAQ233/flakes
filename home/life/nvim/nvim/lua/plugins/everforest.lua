return {
  'neanias/everforest-nvim',
  enabled = vim.g.mytheme == 'everforest',
  config = function()
    require('everforest').setup({
      background = 'medium',
      italics = true,
    })

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        vim.cmd([[ hi BufferLineFill guibg=none ctermbg=none ]])
        vim.cmd([[ hi NvimTreeNormal guibg=none ctermbg=none ]])
        vim.cmd([[ hi NvimTreeEndOfBuffer guibg=none ctermbg=none ]])
        vim.cmd([[ hi lualine_transparent guibg=none ctermbg=none ]])
      end,
    })

    vim.cmd.colorscheme('everforest')
  end,
}
