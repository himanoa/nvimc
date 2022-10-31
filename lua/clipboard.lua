local functional = require('functional')

local system = function(cmd)
  return vim.api.nvim_eval(string.format("system('%q')", cmd))
end

functional.pattern(1, {
  {
    predicate = function()
      return system('uname -a | grep microsoft')
    end,
    andThen = function()
      vim.cmd [[
        let g:clipboard = {
              \   'name': 'myClipboard',
              \   'copy': {
              \      '+': 'win32yank.exe -i',
              \      '*': 'win32yank.exe -i',
              \    },
              \   'paste': {
              \      '+': 'win32yank.exe -o',
              \      '*': 'win32yank.exe -o',
              \   },
              \   'cache_enabled': 1,
              \ }
      ]]
    end
  }
})
