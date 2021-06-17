let g:rc_dir = expand('~/.config/nvim')
function! s:source_rc(rc_file_name)
    let rc_file = expand(g:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction

call s:source_rc('plugins.vim')
call s:source_rc('common.vim')

let s:scripts = split(glob(".git/.vim/**.vim"), "\n")

for script in s:scripts
  execute 'source' script
endfor

command! Plugins :e ~/.config/nvim/plugins.vim
command! Commons :e ~/.config/nvim/common.vim
command! Reload source ~/.config/nvim/init.vim
