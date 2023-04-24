local mod = {
  load = function()
    vim.opt_local.comments = {'b:*','b:-','b:+','b:1.','nb:>'}
    vim.opt_local.formatoptions = "rqnljro"
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end
}

return mod
