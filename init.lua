require('plugin')
require('general')
require('keybind')
require('command')
require('clipboard')

vim.cmd [[
  let s:scripts = split(glob(".git/.vim/**.vim"), "\n")

  for script in s:scripts
    execute 'source' script
  endfor
]]
