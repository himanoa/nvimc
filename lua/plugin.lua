-- Build hooks for plugins that need them
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.kind == 'install' or ev.data.kind == 'update' then
      if ev.data.spec.name == 'avante.nvim' then
        vim.system({ 'make' }, { cwd = ev.data.path })
      elseif ev.data.spec.name == 'nvim-treesitter' then
        vim.cmd('TSUpdate')
      end
    end
  end,
})

vim.pack.add({
  -- editing
  'https://github.com/junegunn/vim-easy-align',
  'https://github.com/folke/flash.nvim',
  'https://github.com/cohama/lexima.vim',
  'https://github.com/tpope/vim-endwise',
  'https://github.com/tpope/vim-abolish',
  'https://github.com/mattn/emmet-vim',
  'https://github.com/kana/vim-textobj-user',
  'https://github.com/sgur/vim-textobj-parameter',
  'https://github.com/glts/vim-textobj-comment',
  'https://github.com/kana/vim-operator-user',
  'https://github.com/tyru/operator-camelize.vim',
  'https://github.com/rhysd/vim-operator-surround',

  -- git
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/airblade/vim-gitgutter',
  'https://github.com/ruanyl/vim-gh-line',

  -- ui
  'https://github.com/sainnhe/everforest',
  'https://github.com/lambdalisue/fern.vim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',

  -- lsp / completion
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range('1') },
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/scalameta/nvim-metals',
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' },

  -- misc
  'https://github.com/himanoa/goshiteki',
  'https://github.com/skywind3000/asyncrun.vim',

  -- avante and deps
  'https://github.com/stevearc/dressing.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/HakonHarnes/img-clip.nvim',
  'https://github.com/zbirenbaum/copilot.lua',
  'https://github.com/yetone/avante.nvim',
})

require('nvim-treesitter.configs').setup({
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },
})

require('telescope').setup({
  defaults = {
    path_display = { 'truncate' },
    preview = false,
  },
})

require('flash').setup({})

require('blink.cmp').setup({
  keymap = { preset = 'enter' },
})

require('mason').setup()
require('mason-lspconfig').setup() -- auto-enables installed servers

vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

require('avante').setup()

vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function()
    vim.diagnostic.setqflist({ open = false })
    vim.diagnostic.setloclist({ open = false })
  end,
})
