return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  enabled = vim.g.mytheme == 'catppuccin',
  config = function()
    require('catppuccin').setup({
      flavour = 'auto',
      background = {
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = false,
      float = {
        transparent = false,
        solid = false,
      },
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      lsp_styles = {
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
          ok = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
          ok = { 'underline' },
        },
        inlay_hints = {
          background = true,
        },
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      auto_integrations = false,
      integrations = {
        gitsigns = true,
        nvimtree = true,
      },
    })

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        vim.api.nvim_set_hl(
          0,
          'PmenuSel',
          { fg = '#ffffff', bg = '#5f87af' }
        )
        vim.api.nvim_set_hl(
          0,
          'CocMenuSel',
          { fg = '#ffffff', bg = '#6e738d' }
        )
      end,
    })

    vim.cmd.colorscheme('catppuccin-nvim')
  end,
}
