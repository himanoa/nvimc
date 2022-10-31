local functional = require("functional")

functional.map(
  {
    { ";", ":", { mode = "normal" } },
    { "X", ":w<CR>", { mode = "normal" } },
    { "<C-o>", "ma<C-o>", { mode = "normal" } },
    { "<S-Tab>", "<C-d>", { mode = "insert"} },
    { "{", "<Cmd>cprevious<CR>", { mode = "normal" } },
    { "}", "<Cmd>cnext<CR>", { mode = "normal" } },
    { "<Space>,", "<Cmd>noh<CR>", { mode = "normal" } },
  },
  function(k,setting)
    functional.pattern(setting, {
      {
        predicate = function(s) return s[3].mode == "normal"; end ,
        andThen = function(s) vim.api.nvim_set_keymap('n', setting[1], setting[2], { noremap = true }); end
      },
      {
        predicate = function(s) return s[3].mode == "insert"; end ,
        andThen = function(s) vim.api.nvim_set_keymap('i', setting[1], setting[2], { noremap=true }); end
      },
    })
  end
)

