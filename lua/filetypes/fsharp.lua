local mod = {
  load = function()
    vim.cmd [[
      call lexima#add_rule({ 'char': "'", 'input_after': '', 'filetype': 'fsharp' })
    ]]
  end
}

return mod
