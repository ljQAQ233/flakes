return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    require('ibl').setup({
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'packer',
          'startify',
          'dashboard',
          'neogitstatus',
          'NvimTree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
          'vimspector-ui',
          'vimspector-disassembly',
          'VimspectorPrompt',
        },
      },
    })
  end,
}
