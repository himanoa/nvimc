call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'rhysd/clever-f.vim'
Plug 'freeo/vim-kalisi'
Plug 'cohama/lexima.vim'
Plug 'Shougo/denite.nvim'
Plug 'cocopon/iceberg.vim'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}

Plug 'tpope/vim-fugitive'

Plug 'Shougo/neomru.vim'

Plug 'jceb/vim-hier'

Plug 'tmsanrinsha/yaml.vim'

Plug 'kana/vim-textobj-user'

Plug 'kana/vim-operator-user'
Plug 'vim-scripts/textobj-verticalbar'
Plug 'tyru/operator-camelize.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'sgur/vim-textobj-parameter'
Plug 'itchyny/lightline.vim'
Plug 'neomake/neomake'

Plug 'junegunn/fzf'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'antoinemadec/coc-fzf'
Plug 'rhysd/vim-operator-surround'
Plug 'mattn/emmet-vim', { 'for': ['html', 'vue'] }
Plug 'airblade/vim-gitgutter'
Plug 'posva/vim-vue'
Plug 'reedes/vim-colors-pencil'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-endwise'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'lambdalisue/fern.vim' 
Plug 'junkblocker/patchreview-vim'
Plug 'chemzqm/denite-git'
Plug 'tyru/eskk.vim'
Plug 'himanoa/goshiteki'
Plug 'ruanyl/vim-gh-line'
Plug 'knsh14/vim-github-link'
Plug 'heraldofsolace/nisha-vim'
Plug 'jparise/vim-graphql'
Plug 'slim-template/vim-slim'

" Initialize plugin system
call plug#end()


function! s:fzf_config()
  function! s:opened_file_directiroy_files()
    execute 'FzfPreviewDirectoryFilesRpc '. expand('%:h')
    return
  endfunction
  noremap <silent> <Space>f :<C-u>FzfPreviewProjectFiles<CR>
  noremap <silent> <Space>c :<C-u>call <SID>opened_file_directiroy_files()<CR>
  noremap <silent> <Space>g :<C-u>FzfPreviewProjectGrepRpc<CR>
  noremap <silent> <Space>r :<C-u>FzfPreviewProjectGrepRpc . --resume
  noremap <silent> <C-b> :<C-u>FzfPreviewBuffersRpc<CR>
endfunction

function! s:coc_config()
  " TextEdit might fail if hidden is not set.
  set hidden

  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  if has('patch8.1.1068')
    " Use `complete_info` if your (Neo)Vim version supports it.
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <C-S-r> <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current line.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Introduce function text object
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Use <TAB> for selections ranges.
  " NOTE: Requires 'textDocument/selectionRange' support from the language server.
  " coc-tsserver, coc-python are the examples of servers that support it.
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
  nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>

  command! -nargs=0 Outlines execute(":CocFzfList outline")
endfunction


function! s:operator_camelize_config()
  map ct  <Plug>(operator-camelize-toggle)
endfunction

function! s:operator_surround_config()
  map <silent> sa <Plug>(operator-surround-append)
  map <silent> sd <Plug>(operator-surround-delete)
  map <silent> sr <Plug>(operator-surround-replace)
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

function! s:vim_bufkill()
  command! WBD write | BD
endfunction

function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

function! s:fern_config()
  augroup fern-custom
    autocmd! *
    autocmd FileType fern call s:init_fern()
  augroup END
endfunction

function! s:eskk_config()
  let g:eskk#dictionary = {
  \ 'path': "/Users/himanoa/Library/Application\ Support/AquaSKK/skk-jisyo.utf-8",
  \ 'encoding': 'utf-8'
  \}

	let g:eskk#large_dictionary = {
	\	'path': "/Users/himanoa/Documents/SKK-JISYO.L",
	\	'sorted': 1,
	\	'encoding': 'euc-jp',
	\}
endfunction

function! s:npm_which(command_name) 
  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/' . a:command_name)
    let l:path = l:npm_bin . '/' . a:command_name
    return l:path
  endif
  return ''
endfunction

function! s:neomake_config()
  call neomake#configure#automake('rw')
  let l:eslint_path = s:npm_which('eslint')
  if strlen(l:eslint_path)
    echo l:eslint_path
    let g:neomake_typescriptreact_eslint_maker = {
    \   'exe'           : l:eslint_path,
    \   'args'          : ['-f', 'compact', expand('%')],
    \   'errorformat': '%E%f: line %l\, col %c\, Error - %m,',
    \   'buffer_output' : 1,
    \ }
    let g:neomake_typescript_eslint_maker = {
    \   'exe'           : l:eslint_path,
    \   'args'          : ['-f', 'compact', expand('%')],
    \   'errorformat': '%E%f: line %l\, col %c\, Error - %m,',
    \   'buffer_output' : 1,
    \ }
    let g:neomake_javascript_eslint_maker = {
    \   'exe'           : l:eslint_path,
    \   'args'          : ['-f', 'compact', expand('%')],
    \   'errorformat': '%E%f: line %l\, col %c\, Error - %m,',
    \   'buffer_output' : 1,
    \ }
  endif

  augroup typescript_neomake
    autocmd!
    autocmd BufEnter *.ts Neomake eslint
    autocmd BufEnter *.tsx Neomake eslint
    autocmd BufEnter *.jsx Neomake eslint
    autocmd BufEnter *.js Neomake eslint
    autocmd BufWritePost *.ts Neomake eslint
    autocmd BufWritePost *.tsx Neomake eslint
    autocmd BufWritePost *.jsx Neomake eslint
    autocmd BufWritePost *.js Neomake eslint
  augroup END
endfunction

call s:operator_surround_config()
call s:operator_camelize_config()
call s:fzf_config()
call s:neomake_config()
call s:coc_config()
call s:memolist_config()
call s:emmet_config()
call s:fern_config()
if has('macunix')
  call s:eskk_config()
endif

