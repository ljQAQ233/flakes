return {
  'puremourning/vimspector',
  lazy = false,
  config = function()
    vim.api.nvim_create_autocmd({
      'WinNew',
    }, {
      pattern = {},
      callback = function()
        local pattern = {
          'vimspector%.Watches%[%d%]',
          'vimspector%.Variables%[%d%]',
          'vimspector%.StackTrace%[%d%]',
        }
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          local raw = vim.api.nvim_buf_get_name(bufnr)
          local name = vim.fn.fnamemodify(raw, ':t')
          for _, v in ipairs(pattern) do
            if name:match(v) then
              vim.api.nvim_buf_set_option(
                bufnr,
                'filetype',
                'vimspector-ui'
              )
              break
            end
          end
        end
      end,
    })

    vim.api.nvim_create_autocmd({
      'BufNew',
    }, {
      callback = function()
        if vim.g.vimspector_session_windows ~= nil then
          local wins = {
            vim.g.vimspector_session_windows.watches,
            vim.g.vimspector_session_windows.variables,
            vim.g.vimspector_session_windows.stack_trace,
          }
          for _, winnr in ipairs(wins) do
            if winnr ~= nil then
              local ui = require('barbecue.ui')
              pcall(ui.update, winnr)
            end
          end
        end
      end,
    })
  end,
}
