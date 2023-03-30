local mod = {
  load = function()
    vim.opt_local.comments = {'b:*','b:-','b:+','b:1.','nb:>'}
    vim.opt_local.formatoptions = "rqnljro"
  end
}

return mod
