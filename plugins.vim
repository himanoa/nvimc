call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'kien/rainbow_parentheses.vim'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'rhysd/clever-f.vim'
Plug 'freeo/vim-kalisi'
Plug 'equalsraf/neovim-gui-shim'
Plug 'altercation/vim-colors-solarized'
Plug 'cohama/lexima.vim'
Plug 'Shougo/denite.nvim'
Plug 'flazz/vim-colorschemes'
Plug 'Shougo/deoplete.nvim'
Plug 'cocopon/iceberg.vim'


Plug 'tpope/vim-fugitive'

Plug 'Shougo/neomru.vim'

Plug 'jceb/vim-hier'

Plug 'tmsanrinsha/yaml.vim'

Plug 'kana/vim-textobj-user'

Plug 'easymotion/vim-easymotion'
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
Plug 'jmcantrell/vim-virtualenv', { 'for': ['python'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'vue'] }
Plug 'zchee/deoplete-jedi', { 'for': ['python'] }
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'posva/vim-vue'
Plug 'glidenote/memolist.vim'
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'delphinus/vim-firestore'
Plug 'reedes/vim-colors-pencil'
" Initialize plugin system
call plug#end()

function! s:denite_config()
  noremap <silent> <Space>m :<C-u>Denite file_mru<CR>
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
  noremap <silent> <Space>f :<C-u>Denite file/rec<CR>
  noremap <silent> <Space>g :<C-u>Denite grep<CR>
  noremap <silent> <Space>l :<C-u>Denite line<CR>
  noremap <silent> <Space>y :<C-u>Denite neoyank<CR>
  noremap <silent> <Space>b :<C-u>Denite buffer<CR>
  noremap <silent> <Space>u :<C-u>Denite -resume <CR>
endfunction

function! s:languageClient_config()
  set hidden
  let g:LanguageClient_serverCommands = {
        \ 'javascript': ['javascript-typescript-stdio'],
        \ 'typescript': ['javascript-typescript-stdio'],
        \ 'javascript.jsx': ['javascript-typescript-stdio'],
        \ 'vue': ['vls'],
        \ 'ruby': ['language_server-ruby'],
        \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
        \ 'scala': ['metals-vim'],
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
        \ 'vue': ['eslint']
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

call s:ale_config()
call s:operator_surround_config()
call s:operator_camelize_config()
call s:denite_config()
call s:deoplete_config()
call s:languageClient_config()
call s:memolist_config()
call s:emmet_config()
