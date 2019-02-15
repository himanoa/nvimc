set relativenumber
set encoding=utf-8
set fileencoding=utf-8
set showmatch
set clipboard+=unnamedplus
set noswapfile
set expandtab
set tabstop=2
set softtabstop=2
set smartindent
set shiftwidth=2
set incsearch
set inccommand=split
set noshowmode
set spelllang+=cjk
set ttyfast
set lazyredraw
augroup Spell
  autocmd!
  autocmd Filetype markdown set spell
  autocmd Filetype gitcommit set spell
augroup END

noremap <SPACE>, :noh<CR>

noremap s> <C-w>>
noremap s< <C-w><
noremap s[ <C-w>+
noremap s] <C-w>-
noremap th gT
noremap tl gt

noremap ; :
noremap <Tab> <C-o>
noremap X :w<CR>
noremap <C-o> ma<C-o>
tnoremap <ESC> <C-\><C-n>
syntax on
autocmd BufWritePre * :%s/\s\+$//ge
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline,bold
:highlight LineNr ctermfg=1
au BufNewFile,BufRead *.tag setf pug
colorscheme default
hi Cursorline ctermfg=0 ctermbg=130 gui=bold,reverse guifg=Sienna4 guibg=White

filetype plugin indent on
syntax enable
augroup MyVimrc
  autocmd!
augroup END
autocmd MyVimrc FileType yaml setlocal foldmethod=syntax
setlocal signcolumn=yes
