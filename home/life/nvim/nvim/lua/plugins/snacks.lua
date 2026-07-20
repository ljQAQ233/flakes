return {
  'folke/snacks.nvim',
  config = function()
    require('snacks').setup({
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      image = {
        doc = {
          enabled = true,
          inline = false,
          float = true,
          max_width = 80,
          max_height = 40,
        },
        icons = {
          math = '󰪚 ',
          chart = '󰄧 ',
          image = ' ',
        },
        math = {
          enabled = true,
        },
      },
      indent = { enabled = false },
      input = { enabled = false },
      picker = { enabled = false },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
      styles = {
        snacks_image = {
          border = 'none',
          backdrop = false,
        },
      },
    })
  end,
}
