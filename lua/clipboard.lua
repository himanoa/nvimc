local functional = require('functional')

local system = function(cmd)
  return vim.api.nvim_eval(string.format("system('%q')", cmd))
end

functional.pattern(1, {
  {
    predicate = function()
      return vim.fn["system"]('uname -a | grep microsoft') ~= ""
    end,
    and_then = function()
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
  },
  {
    predicate = function()
      return true
    end,
    and_then = function()
      vim.cmd [[
        let g:clipboard = {
              \   'name': 'myClipboard',
              \   'copy': {
              \      '+': 'xsel -bi',
              \      '*': 'xsel -bi',
              \    },
              \   'paste': {
              \      '+': 'xsel -bo',
              \      '*': 'xsel -bo',
              \   },
              \   'cache_enabled': 1,
              \ }
      ]]
    end
  }
})
