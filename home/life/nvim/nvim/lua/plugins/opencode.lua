return {
  'nickjvandyke/opencode.nvim',
  version = '*',
  keys = {
    {
      '<leader>oa',
      function()
        require('opencode').ask('@this: ')
      end,
      desc = 'Ask OpenCode…',
      mode = 'x',
    },
    {
      '<leader>os',
      function()
        require('opencode').select()
      end,
      desc = 'Select OpenCode…',
      mode = 'x',
    },
    {
      'go',
      function()
        return require('opencode').operator('@this ')
      end,
      desc = 'Append range to OpenCode',
      expr = true,
      mode = 'x',
    },
    {
      'goo',
      function()
        return require('opencode').operator('@this ') .. '_'
      end,
      desc = 'Append line to OpenCode',
      expr = true,
      mode = 'x',
    },
    {
      '<S-C-u>',
      function()
        require('opencode').command('session.half.page.up')
      end,
      desc = 'Scroll OpenCode up',
      mode = 'x',
    },
    {
      '<S-C-d>',
      function()
        require('opencode').command('session.half.page.down')
      end,
      desc = 'Scroll OpenCode down',
      mode = 'x',
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        start = function()
          vim.fn.jobstart({
            'kitty',
            '--detach',
            '--title',
            'OpenCode',
            'opencode',
            '--port',
          }, { detach = true })
        end,
      },
    }

    vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`
  end,
}
