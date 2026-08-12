local options = {
  mouse = '',
  signcolumn = 'yes',
  termguicolors = true,
  number = true,
  relativenumber = true,
  showmatch = true,
  swapfile = false,
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  smartindent = true,
  shiftwidth = 2,
  inccommand = 'split',
  pumblend = 20,
  winblend = 20,
  background = 'dark',
  grepprg = 'rg --vimgrep',
  statusline = ' %{FugitiveHead()} %f %m%r%=%y %l:%c ',
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.opt.spelllang:append('cjk')

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'gitcommit' },
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  command = [[:silent! %s/\r//g]],
})

vim.cmd.colorscheme('everforest')

vim.cmd [[
  highlight DiffAdd guifg=none guibg=#334539
  highlight DiffChange guifg=none guibg=#334539
  highlight DiffDelete guifg=none guibg=#45333a
  highlight DiffText guifg=none guibg=#5f5d42
  highlight DiffLine guifg=none guibg=#8fa1b3
]]

for ft, mod in pairs({
  markdown = 'filetypes/markdown',
  fsharp = 'filetypes/fsharp',
  purescript = 'filetypes/purescript',
}) do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = ft,
    callback = function()
      require(mod).load()
    end,
  })
end

-- Jump to first result on multiple definitions, stash the rest in loclist
vim.lsp.handlers['textDocument/definition'] = function(_, result, ctx)
  if not result or vim.tbl_isempty(result) then return end

  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not client then return end

  if vim.islist(result) then
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
