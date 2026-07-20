return {
  'mbbill/undotree',
  lazy = true,
  keys = {
    { '<leader><F5>', vim.cmd.UndotreeToggle },
  },
  setup = function()
    if vim.fn.has('persistent_undo') then
      local target_path = vim.fn.stdpath('state') .. '/undo/'
      if vim.fn.isdirectory(target_path) == 0 then
        vim.fn.mkdir(target_path, 'p', 448)
      end
      -- vim.opt.undodir = target_path
      -- vim.opt.undofile = true
    end
  end,
}
