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

function! Operator_suddendeath_do(motion_wise)
  if a:motion_wise !=# 'line'
    echoerr 'operator-suddendeath supports linewise only'
    return
  endif
  let put = getpos("']")[1] == line('$') ? 'p' : 'P'
  normal! `[V`]d
  let str = split(@", '\n')
  let @" = s:to_suddendeath(str)
  execute 'normal!' put
endfunction


function! s:to_suddendeath(str)
  let width = max(map(copy(a:str), 'strwidth(v:val)'))
  let suddendeath = '+' . repeat('-', width) . '+' . "\n"
  for s in a:str
    let w = strwidth(s)
    let suddendeath .= '|' . s . repeat(' ', width - w) . '|' . "\n"
  endfor
  let suddendeath .= '+' . repeat('-', width) . '+' . "\n"
  return suddendeath

  " let width = max(map(copy(a:str), 'strwidth(v:val)'))
  " let mb_width = width / 2 + 1
  " let suddendeath = '+' . repeat('-', mb_width) . '+' . "\n"
  " for s in a:str
  "   let w = strwidth(s)
  "   let suddendeath .= ' ' . s . repeat(' ', width - w) . ' ' . "\n"
  " endfor
  " let suddendeath = '+' . repeat('-', mb_width) . '+' . "\n"
  " return suddendeath
endfunction

call operator#user#define('suddendeath', 'Operator_suddendeath_do')
map X <Plug>(operator-suddendeath)
