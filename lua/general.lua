local functional = require("functional")
local markdown = require('filetypes/markdown')
local purescript = require('filetypes/purescript')
local fsharp = require('filetypes/fsharp')

functional.map(
{
  mouse="",
  signcolumn = "yes",
  autoread = true,
  spelllang = {unpack(vim.opt.spelllang), "cjk"},
  termguicolors = true,
  lazyredraw = false,
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
  pumblend=20,
  winblend=20,
  wildoptions="pum",
  background="dark"
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
  colorscheme everforest
]]

vim.cmd [[
  highlight DiffAdd guifg=none guibg=#334539
  highlight DiffChange guifg=none guibg=#334539
  highlight DiffDelete guifg=none guibg=#45333a
  highlight DiffText guifg=none guibg=#5f5d42
  highlight DiffLine guifg=none guibg=#8fa1b3
]]


vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(args)
    markdown.load()
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "fsharp",
  callback = function(args)
    fsharp.load()
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "purescript",
  callback = function(args)
    purescript.load()
  end
})

vim.lsp.handlers["textDocument/definition"] = function(_, result, ctx)
  if not result or vim.tbl_isempty(result) then return end

  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not client then return end

  if vim.tbl_islist(result) then
    vim.lsp.util.jump_to_location(result[1], client.offset_encoding)

    if #result > 1 then
      local current_qf = vim.fn.getqflist()
      local items = vim.lsp.util.locations_to_items(result, client.offset_encoding)
      vim.fn.setloclist(0, items)
      vim.fn.setqflist(current_qf)
    end
  else
    vim.lsp.util.jump_to_location(result, client.offset_encoding)
  end
end

vim.g.loaded_matchparen = 0
