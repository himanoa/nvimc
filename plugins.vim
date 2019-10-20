call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'rhysd/clever-f.vim'
Plug 'freeo/vim-kalisi'
Plug 'cohama/lexima.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim'
Plug 'cocopon/iceberg.vim'

Plug 'tpope/vim-fugitive'

Plug 'Shougo/neomru.vim'

Plug 'jceb/vim-hier'

Plug 'tmsanrinsha/yaml.vim'

Plug 'kana/vim-textobj-user'

Plug 'kana/vim-operator-user'
Plug 'tyru/operator-camelize.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'sgur/vim-textobj-parameter'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'junegunn/fzf'
Plug 'rhysd/vim-operator-surround'
Plug 'mattn/emmet-vim', { 'for': ['html', 'vue'] }
Plug 'zchee/deoplete-jedi', { 'for': ['python'] }
Plug 'airblade/vim-gitgutter'
Plug 'posva/vim-vue'
Plug 'reedes/vim-colors-pencil'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'qpkorr/vim-bufkill'
" Initialize plugin system
call plug#end()

function! s:denite_config()
  autocmd FileType denite call s:denite_buffer_keymaps()
  function! s:denite_buffer_keymaps() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
    \ denite#do_map('toggle_select').'j'
  endfunction
  noremap <silent> <Space>m :<C-u>Denite -split=floating file_mru<CR>
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
  noremap <silent> <Space>f :<C-u>Denite -split=floating file/rec<CR>
  noremap <silent> <Space>fs :<C-u>Denite -split=floating -path=src file/rec<CR>
  noremap <silent> <Space>fa :<C-u>Denite -split=floating -path=app file/rec<CR>
  noremap <silent> <Space>fc :<C-u>call denite#helper#call_denite('Denite', '-path=' . expand('%:h') . ' file/rec', '', '')<CR>
  noremap <silent> <Space>g :<C-u>Denite -split=floating grep<CR>
  noremap <silent> <Space>l :<C-u>Denite -split=floating line<CR>
  noremap <silent> <Space>y :<C-u>Denite -split=floating neoyank<CR>
  noremap <silent> <Space>b :<C-u>Denite -split=floating buffer<CR>
  noremap <silent> <Space>u :<C-u>Denite -split=floating -resume <CR>
  noremap <silent> <C-n> :<C-u>Denite -split=floating file file:new <CR>
  noremap <silent> <C-b> :<C-u>Denite -split=floating buffer<CR>
endfunction

function! s:languageClient_config()
  set hidden
  let g:LanguageClient_serverCommands = {
        \ 'javascript': ['javascript-typescript-stdio'],
        \ 'javascript.jsx': ['javascript-typescript-stdio'],
        \ 'vue': ['vls'],
        \ 'ruby': ['language_server-ruby'],
        \ 'rust': ['rls'],
        \ 'scala': ['metals-vim'],
        \ 'tf': ['terraform-lsp'],
        \ }

  nnoremap <silent> <C-k> :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
  nnoremap <silent> <F12> :call LanguageClient_textDocument_codeAction()<CR>
endfunction

function! s:ale_config()
  let l:existConfig = 0
  let l:prettierrcs = [".prettierrc", ".prettierrc.toml", ".prettierrc.config.js", ".prettierrc.js"]
  for item in l:prettierrcs
    let l:existConfig = l:existConfig + filereadable(item)
  endfor
  let g:ale_fixers = {
        \ 'javascript': ['eslint'],
        \ 'typescript': ['eslint'],
        \ 'vue': ['eslint'],
        \ 'php': ['php_cs_fixer']
        \ }
  let g:ale_fix_on_save = 1
  if l:existConfig > 0
    call insert(g:ale_fixers.javascript, "prettier")
    call insert(g:ale_fixers.typescript, "prettier")
    call insert(g:ale_fixers.vue, "prettier")
  endif
endfunction

function! s:operator_camelize_config()
  map ct  <Plug>(operator-camelize-toggle)
endfunction

function! s:operator_surround_config()
  map <silent> sa <Plug>(operator-surround-append)
  map <silent> sd <Plug>(operator-surround-delete)
  map <silent> sr <Plug>(operator-surround-replace)
endfunction

function! s:deoplete_config()
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#complete_method = 'omnifunc'
endfunction

function! s:memolist_config()
  nnoremap <Leader>mn  :MemoNew<CR>
  nnoremap <Leader>ml  :MemoList<CR>
  nnoremap <Leader>mg  :MemoGrep<CR>
endfunction

function! s:emmet_config()
  let g:user_emmet_leader_key = '<C-e>'
  let g:user_emmet_install_global = 1
endfunction

function! s:deol_config()
  noremap <C-t> :<C-u> :Deol -split=floating<CR>
endfunction

function! s:ts_config()
  nnoremap <silent> <C-k> :TSType<CR>
  nnoremap <silent> gd :TSDef<CR>
  nnoremap <silent> <F2> :TSRenameCR>
  nnoremap <silent> <F12> :TSCodeFix<CR>
endfunction

function! s:vim_bufkill()
  command! WBD write | BD
endfunction

call s:ale_config()
call s:operator_surround_config()
call s:operator_camelize_config()
call s:denite_config()
call s:deoplete_config()
call s:languageClient_config()
call s:memolist_config()
call s:emmet_config()
call s:deol_config()
autocmd FileType typescript call s:ts_config()
autocmd FileType typescript.tsx call s:ts_config()

