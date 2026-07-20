return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      -- format selected code
      '<leader>f',
      function()
        require('conform').format(
          { async = true, timeout_ms = 5000000 },
          function(err)
            if not err then
              local mode = vim.api.nvim_get_mode().mode
              if vim.startswith(string.lower(mode), 'v') then
                vim.api.nvim_feedkeys(
                  vim.api.nvim_replace_termcodes(
                    '<Esc>',
                    true,
                    false,
                    true
                  ),
                  'n',
                  true
                )
              end
            end
          end
        )
      end,
      mode = 'v',
      desc = 'Format selected code',
    },
  },
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        ['lua'] = { 'stylua' },
        ['json'] = { 'yq' },
        ['yaml'] = { 'yamlfmt' },
        ['nix'] = { 'nixfmt' },
        ['rust'] = { 'rustfmt' },
        ['c'] = { 'clang-format' },
        ['cpp'] = { 'clang-format' },
      },
      format_on_save = function(bufnr)
        local filetype = vim.bo[bufnr].filetype
        local allowed = {
          'lua',
          'json',
          'yaml',
          'nix',
          'rust',
        }
        if vim.tbl_contains(allowed, filetype) then
          return {
            timeout_ms = 500,
            lsp_fallback = false,
          }
        end
      end,
    })
  end,
}
