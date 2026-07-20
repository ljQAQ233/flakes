local opt = vim.opt

opt.tabstop = 4
opt.scrolloff = 5
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.cursorline = true

opt.number = true
opt.relativenumber = true

vim.cmd(
  [[ hi default link LspCxxHlSymFunction cxxFunction                       ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymFunctionParameter cxxParameter             ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymFileVariableStatic cxxFileVariableStatic   ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymStruct cxxStruct                           ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymStructField cxxStructField                 ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymFileTypeAlias cxxTypeAlias                 ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymClassField cxxStructField                  ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymEnum cxxEnum                               ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymVariableExtern cxxFileVariableStatic       ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymVariable cxxVariable                       ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymMacro cxxMacro                             ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymEnumMember cxxEnumMember                   ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymParameter cxxParameter                     ]]
)
vim.cmd(
  [[ hi default link LspCxxHlSymClass cxxTypeAlias                         ]]
)
