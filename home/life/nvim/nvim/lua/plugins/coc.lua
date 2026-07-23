return {
  'neoclide/coc.nvim',
  branch = 'release',
  lazy = false,
  keys = {
    { 'gd', '<Plug>(coc-definition)' },
    { 'gD', ':vsplit<CR><Plug>(coc-definition)' },
    { 'gy', '<Plug>(coc-type-definition)' },
    { 'gi', '<Plug>(coc-implementation)' },
    { 'gr', '<Plug>(coc-references)' },
    { '<Leader>i', ':CocCommand document.toggleInlayHint<CR>' },
    { '<F2>', '<Plug>(coc-rename)' },
    { '<Leader>t', '<Plug>(coc-translator-p)' },
    {
      '<C-\\>',
      [[ coc#refresh() ]],
      expr = true,
      mode = 'i',
    },
    {
      'K',
      function()
        if
          vim.fn.CocAction('hasProvider', 'hover')
          and not vim.tbl_isempty(vim.fn.CocAction('getHover'))
        then
          vim.fn.CocActionAsync('doHover')
        else
          vim.cmd('normal! K')
        end
      end,
    },
  },
  config = function()
    -- fixup json
    vim.cmd(
      [[ autocmd BufRead,BufNewFile coc-settings.json set filetype=jsonc ]]
    )
    -- auto install extensions

    vim.g.coc_global_extensions = {
      'coc-marketplace',
      'coc-git',
      'coc-json',
      'coc-clangd',
      '@ph_chen/coc-nix',
      '@statiolake/coc-sumneko-lua',
    }
  end,
}
