require('plugin')
require('general')
require('keybind')
require('command')

-- Source project-local vimscript from .git/.vim/
for _, script in ipairs(vim.fn.glob('.git/.vim/**.vim', false, true)) do
  vim.cmd.source(script)
end
