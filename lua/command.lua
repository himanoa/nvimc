local functional = require("functional")

local commands = {
  Todo = ":new ~/todo.md",
  Build = ":AsyncRun ./himanoa-build",
}

local apply_command = function(name, implementation)
  vim.api.nvim_create_user_command(name, implementation, {})
end

functional.map(commands, apply_command)

vim.cmd [[
  command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
]]
