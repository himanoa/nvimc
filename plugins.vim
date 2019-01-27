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

Plug 'Shougo/neosnippet-snippets'

Plug 'tpope/vim-fugitive'

Plug 'Shougo/neomru.vim'

Plug 'jceb/vim-hier'

Plug 'stephpy/vim-yaml'

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
Plug 'python-mode/python-mode', { 'for': ['python'] }
Plug 'jmcantrell/vim-virtualenv', { 'for': ['python'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'vue'] }
Plug 'zchee/deoplete-jedi', { 'for': ['python'] }
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/goyo.vim'
" Initialize plugin system
call plug#end()

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
\ ['git', 'ls-files', '-co', '--exclude-standard'])
nnoremap <silent> <Space>f :<C-u>Denite
\ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
nnoremap <silent> <Space>ff :<C-u>Denite
\ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
noremap <silent> <Space>m :<C-u>Denite file_mru<CR>
noremap <silent> <Space>ft :<C-u>Denite -default-action=tabopen
\ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
noremap <silent> <Space>fs :<C-u>Denite -default-action=split
\ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
noremap <silent> <Space>fv :<C-u>Denite -default-action=vsplit
\ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
noremap <silent> <Space>g :<C-u>Denite grep<CR>
noremap <silent> <Space>l :<C-u>Denite line<CR>
noremap <silent> <Space>y :<C-u>Denite neoyank<CR>
noremap <silent> <Space>b :<C-u>Denite buffer<CR>
noremap <silent> <Space>u :<C-u>Denite -resume <CR>

if isdirectory(".git")
    call denite#custom#var('file_rec', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])
    call denite#custom#var('grep', 'command', ['git', '--no-pager', 'grep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'separator', [])
    call denite#custom#var('grep', 'default_opts', ['-nH'])
endif

set hidden
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'ruby': ['language_server-ruby'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

nnoremap <silent> <C-k> :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier']
      \ }
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

map ct  <Plug>(operator-camelize-toggle)
map <silent> sa <Plug>(operator-surround-append)
map <silent> sd <Plug>(operator-surround-delete)
map <silent> sr <Plug>(operator-surround-replace)

let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = 'omnifunc'

imap <C-f> <Plug>(neosnippet_expand_or_jump)
smap <C-f> <Plug>(neosnippet_expand_or_jump)
