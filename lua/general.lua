local functional = require("functional")

functional.map(
{
  signcolumn = "yes",
  autoread = true,
  spelllang = {unpack(vim.opt.spelllang), "cjk"},
  termguicolors = true,
  number = true,
  relativenumber = true,
  encoding="utf-8",
  fileencoding="utf-8",
  showmatch = true,
  swapfile = false,
  expandtab = true,
  tabstop=2,
  softtabstop=2,
  smartindent = true,
  autoindent = true,
  shiftwidth=2,
  incsearch= true,
  inccommand="split",
  ttyfast= true,
  pumblend=20,
  winblend=20,
  wildoptions="pum"
},
function(key, value)
  vim.opt[key] = value
end
)

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"markdown", "gitcommit"},
  callback = function()
    vim.opt.spell = true
  end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = ":silent! %s/\r//g"
})

vim.cmd [[
  filetype plugin indent on
  syntax enable
]]

vim.cmd [[
  highlight DiffAdd guifg=NONE guibg=#334539
  highlight DiffChange guifg=NONE guibg=#334539
  highlight DiffDelete guifg=NONE guibg=#45333a
  highlight DiffText guifg=NONE guibg=#5f5d42
  highlight DiffLine guifg=NONE guibg=#8fa1b3
]]


