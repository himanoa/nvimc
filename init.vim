let g:rc_dir = expand('~/.config/nvim')
function! s:source_rc(rc_file_name)
    let rc_file = expand(g:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction

call s:source_rc('plugins.vim')
call s:source_rc('common.vim')

command Plugins :e ~/.config/nvim/plugins.vim
