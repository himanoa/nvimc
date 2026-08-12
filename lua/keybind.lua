local general_keybind = {
  { 'n', ';', ':' },
  { 'n', 'X', ':w<CR>' },
  { 'i', '<S-Tab>', '<C-d>' },
  { 'n', '{', '<Cmd>cprevious<CR>' },
  { 'n', '}', '<Cmd>cnext<CR>' },
  { 'n', '<Space>,', '<Cmd>noh<CR>' },
  { 'i', '<F15>,', '' },
  { 'i', '<F14>,', '' },
}

local telescope_keybind = {
  { 'n', '<Space>f', function() require('telescope.builtin').find_files() end },
  { 'n', '<Space>g', function() require('telescope.builtin').live_grep() end },
  { 'n', '<Space>b', function() require('telescope.builtin').buffers() end },
  { 'n', '<Space>h', function() require('telescope.builtin').help_tags() end },
  { 'n', '<Space>c', function()
    require('telescope.builtin').find_files({ cwd = require('telescope.utils').buffer_dir() })
  end },
}

local lsp_keybind = {
  { 'n', 'gd', vim.lsp.buf.definition },
  { 'n', 'gy', vim.lsp.buf.type_definition },
  { 'n', 'gi', vim.lsp.buf.implementation },
  { 'n', 'gr', vim.lsp.buf.references },
  { 'n', 'K', vim.lsp.buf.hover },
  { 'n', 'L', vim.lsp.buf.code_action },
  { 'n', 'M', vim.diagnostic.open_float },
  { 'n', '<leader>cl', vim.lsp.codelens.run },
  { 'n', '<leader>sh', vim.lsp.buf.signature_help },
  { 'n', '<leader>rn', vim.lsp.buf.rename },
  { 'n', '<leader>f', vim.lsp.buf.format },
  { 'n', '<leader>ca', vim.lsp.buf.code_action },
  { 'n', '<leader>ws', function() require('metals').hover_worksheet() end },
  { 'n', '<leader>aa', vim.diagnostic.setqflist },
  { 'n', '<leader>ae', function() vim.diagnostic.setqflist({ severity = 'E' }) end },
  { 'n', '<leader>aw', function() vim.diagnostic.setqflist({ severity = 'W' }) end },
  { 'n', '<leader>d', vim.diagnostic.setloclist },
}

local operator_keybind = {
  { { 'n', 'v' }, 'ct', '<Plug>(operator-camelize-toggle)' },
  { { 'n', 'v' }, 'sa', '<Plug>(operator-surround-append)' },
  { { 'n', 'v' }, 'sd', '<Plug>(operator-surround-delete)' },
  { { 'n', 'v' }, 'sr', '<Plug>(operator-surround-replace)' },
}

for _, keybinds in ipairs({ general_keybind, telescope_keybind, lsp_keybind, operator_keybind }) do
  for _, bind in ipairs(keybinds) do
    vim.keymap.set(bind[1], bind[2], bind[3])
  end
end
