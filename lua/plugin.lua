local functional = require('functional')

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}
  use {'junegunn/vim-easy-align'}

  use {'rhysd/clever-f.vim'}
  use {'freeo/vim-kalisi'}
  use {'cohama/lexima.vim'}
  use {'cocopon/iceberg.vim'}
  use { 'jremmen/vim-ripgrep' }

  use {'tpope/vim-fugitive'}

  use {'Shougo/neomru.vim'}

  use {'jceb/vim-hier'}
  use {'tmsanrinsha/yaml.vim'}

  use {'kana/vim-textobj-user'}

  use {'kana/vim-operator-user'}
  use {'vim-scripts/textobj-verticalbar'}
  use {'tyru/operator-camelize.vim'}
  use {'editorconfig/editorconfig-vim'}
  use {'sgur/vim-textobj-parameter'}
  use {'itchyny/lightline.vim', config = function ()
    vim.cmd [[
      let g:lightline#gitdiff#indicator_added = '+'
      let g:lightline#gitdiff#indicator_deleted = '-'
      let g:lightline#gitdiff#separator = ' '
      let g:lightline = {
              \ 'colorscheme': 'wombat',
              \ 'mode_map': {'c': 'NORMAL'},
              \ 'active': {
              \   'left': [ [ 'branchname' ], [ 'filename' ], ['gitdiff'] ],
              \   'right': [ ['filetype'], ['lineinfo'] ]
              \ },
              \ 'component_function': {
              \   'modified': 'LightlineModified',
              \   'readonly': 'LightlineReadonly',
              \   'fugitive': 'LightlineFugitive',
              \   'filename': 'LightlineFilename',
              \   'branchname': 'LightlineBranchname'
              \ },
              \ 'component': {
              \   'gitstatus': '%<%{lightline_gitdiff#get_status()}',
              \ },
              \ 'component_expand': {
              \   'gitdiff': 'lightline#gitdiff#get'
              \ },
              \ 'component_type': {
              \   'gitdiff': 'middle'
              \ },
              \ 'component_visible_condition': {
              \   'gitstatus': 'lightline_gitdiff#get_status() !=# ""',
              \ },
              \ }

      function! LightlineModified()
        return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
      endfunction

      function! LightlineReadonly()
        return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
      endfunction

      function! LightlineFilename()
        return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
              \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
              \  &ft == 'unite' ? unite#get_status_string() :
              \  &ft == 'vimshell' ? vimshell#get_status_string() :
              \ '' != expand('%:t') ? expand('%') : '[No Name]') .
              \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
      endfunction

      function! LightlineFugitive()
        if &ft !~? 'vimfiler\|gundo' && exists('*FugitiveHead')
          return FugitiveHead()
        else
          return ''
        endif
      endfunction

      function! LightlineFileformat()
        return winwidth(0) > 70 ? &fileformat : ''
      endfunction

      function! LightlineFiletype()
        return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
      endfunction

      function! LightlineFileencoding()
        return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
      endfunction

      function! LightlineMode()
        return winwidth(0) > 60 ? lightline#mode() : ''
      endfunction

      function! LightlineBranchname()
        return gitbranch#name()
      endfunction
    ]]
  end}
  use {'neomake/neomake'}

  use {'rhysd/vim-operator-surround'}
  use {'mattn/emmet-vim', ft = {"html", "vue"} }
  use {'airblade/vim-gitgutter'}
  use {'posva/vim-vue'}
  use {'reedes/vim-colors-pencil'}
  use {'HerringtonDarkholme/yats.vim'}
  use {'qpkorr/vim-bufkill'}
  use {'tpope/vim-endwise'}
  use {'lambdalisue/fern.vim', branch = 'main'}
  use {'junkblocker/patchreview-vim'}
  use {'chemzqm/denite-git'}
  use { 'neovim/nvim-lspconfig' }
  use { "williamboman/mason.nvim", config = function()
    local mason = require("mason-lspconfig")
    mason.setup()
  end}
  use {"williamboman/mason-lspconfig.nvim"}
  use {'himanoa/goshiteki'}
  use {'ruanyl/vim-gh-line'}
  use {'knsh14/vim-github-link'}
  use {'heraldofsolace/nisha-vim'}
  use {'jparise/vim-graphql'}
  use {'slim-template/vim-slim'}
  use {'tyru/caw.vim'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
  require('nvim-treesitter.configs').setup {
    highlight = {
    enable = true
    }
  }
  end}
  use {'itchyny/vim-gitbranch'}
  use {'niklaas/lightline-gitdiff'}
  use {'honza/vim-snippets'}
  use {'~/src/github.com/alp-inc/z-labo-himanoa/alp-vim'}
  use {'skywind3000/asyncrun.vim'}
  use {'glts/vim-textobj-comment'}
  use {'nocksock/bloop-vim'}
  use {'tpope/vim-abolish'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim', config = function()
    require('telescope').setup({
      defaults = {
        layout_config = {
          bottom_pane = {
            height = 25,
            preview_cutoff = 120,
            prompt_position = "top"
          },
          center = {
            height = 0.4,
            preview_cutoff = 40,
            prompt_position = "top",
            width = 0.5
          },
          cursor = {
            height = 0.9,
            preview_cutoff = 40,
            width = 0.8
          },
          horizontal = {
            height = 0.9,
            preview_cutoff = 120,
            prompt_position = "bottom",
            width = 0.8
          },
          vertical = {
            height = 0.9,
            preview_cutoff = 40,
            prompt_position = "bottom",
            width = 0.8
          }
        },
        path_display= {"truncate"},
        preview = false
        -- other defaults configuration here
      },
      extensions = {
        fzf = {
          fuzzy = false,                    -- false will only do exact matching
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = false,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
      },
    });
    require('telescope')
  end}

  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  use {"rafamadriz/friendly-snippets"}
  use {'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }}
  use {'hrsh7th/nvim-cmp', config = function()
    local cmp = require'cmp'

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }
      }, {
        { name = 'buffer' },
      })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = 'buffer' },
      })
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
  end}

  local on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
  end

  -- nvim-metals
  local metals_config = require("metals").bare_config()
  
  -- Example of settings
  metals_config.settings = {
    showImplicitArguments = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  }
  
  -- *READ THIS*
  -- I *highly* recommend setting statusBarProvider to true, however if you do,
  -- you *have* to have a setting to display this in your statusline or else
  -- you'll not see any messages from metals. There is more info in the help
  -- docs about this
  -- metals_config.init_options.statusBarProvider = "on"
  
  -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
  metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
  
  metals_config.on_attach = function(client, bufnr)
  end
  
  -- Autocmd that will actually be in charging of starting the whole thing
  local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    -- NOTE: You may or may not want java included here. You will need it if you
    -- want basic Java support but it may also conflict if you are using
    -- something like nvim-jdtls which also works on a java filetype autocmd.
    pattern = { "scala", "sbt", "java" },
    callback = function()
      require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
  })

  require("mason-lspconfig").setup_handlers {
    function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {
        on_attach = on_attach
      }
    end
  }


  require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "typescript-language-server", "--stdio" },
    init_options= {
      hostInfo = "neovim",
      preferences = {
        importModuleSpecifierPreference = "non-relative"
      }
    }
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
