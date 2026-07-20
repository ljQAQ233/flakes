return {
  'voldikss/vim-floaterm',
  keys = {
    { '<leader>=', ':FloatermNew --position=bottomright --width=80 --height=20<CR>', desc = 'New floaterm' },
    { '<leader>-', ':FloatermKill<CR>', desc = 'Kill floaterm' },
  },
}
