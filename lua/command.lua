local functional = require("functional")

local commands = {
  Todo = ":new ~/todo.md",
  Build = ":AsyncRun ./himanoa-build",
  Test = ":AsyncRun ./himanoa-test",
  CommandConfig = ":new ~/.config/nvim/lua/command.lua",
  GeneralConfig = ":new ~/.config/nvim/lua/general.lua",
  KeybindConfig = "new ~/.config/nvim/lua/keybind.lua",
  ClipboardConfig = "new ~/.config/nvim/lua/clipboard.lua",
  PluginConfig = "new ~/.config/nvim/lua/plugin.lua",
}

local apply_command = function(name, implementation)
  vim.api.nvim_create_user_command(name, implementation, {})
end

functional.map(commands, apply_command)

vim.cmd [[
  command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
]]
