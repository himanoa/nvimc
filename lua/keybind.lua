local functional = require("functional")

local telescope_keybind = {
    { "<Space>f", "<Cmd>lua require('telescope.builtin').find_files()<CR>", { mode = "normal" } },
    { "<Space>g", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", { mode = "normal" } },
    { "<Space>b", "<Cmd>lua require('telescope.builtin').buffers()<CR>", { mode = "normal" } },
    { "<Space>h", "<Cmd>lua require('telescope.builtin').help_tags()<CR>", { mode = "normal" } },
    { "<Space>c", "<Cmd>lua require('telescope.builtin').find_files({ cwd = require('telescope.utils').buffer_dir() })<CR>", { mode = "normal" } },
}

local coc_keybind = {
  { "gd", "<Plug>(coc-definition)", { mode = 'normal' } },
  { "gy", "<Plug>(coc-type-definition)", { mode = 'normal' } },
  { "gi", "<Plug>(coc-implementation)", { mode = 'normal' } },
  { "gr", "<Plug>(coc-references)", { mode = 'normal' } },
  { "K", ":call CocAction('doHover')<CR>", { mode = 'normal' } },
  { "L", "<Plug>(coc-codeaction-line)", { mode = 'normal' } },
  { "<C-w><C-k>", "<Plug>(coc-float-jump)", { mode = 'normal' } },
  { "M", ":CocCommand<CR>", { mode = 'normal' } },
}

local operator_camelize_keybind = {
  { "ct", "<Plug>(operator-camelize-toggle)", { mode = 'normal' } },
  { "ct", "<Plug>(operator-camelize-toggle)", { mode = 'visual' } },
}

local operator_surround_keybind = {
  { "sa", "<Plug>(operator-surround-append)", { mode = 'normal' } },
  { "sd", "<Plug>(operator-surround-delete-toggle)", { mode = 'normal' } },
  { "sr", "<Plug>(operator-surround-replace-toggle)", { mode = 'normal' } },
  { "sa", "<Plug>(operator-surround-append)", { mode = 'visual' } },
  { "sd", "<Plug>(operator-surround-delete-toggle)", { mode = 'visual' } },
  { "sr", "<Plug>(operator-surround-replace-toggle)", { mode = 'visual' } },
}

functional.map(
  functional.combine({
    { ";", ":", { mode = "normal" } },
    { "X", ":w<CR>", { mode = "normal" } },
    { "<S-Tab>", "<C-d>", { mode = "insert"} },
    { "{", "<Cmd>cprevious<CR>", { mode = "normal" } },
    { "}", "<Cmd>cnext<CR>", { mode = "normal" } },
    { "<Space>,", "<Cmd>noh<CR>", { mode = "normal" } },
  },
    telescope_keybind,
    coc_keybind,
    operator_camelize_keybind,
    operator_surround_keybind
  ),
  function(key,setting)
    functional.pattern(setting, {
      {
        predicate = function(s) return s[3].mode == "normal"; end ,
        and_then = function(s) vim.api.nvim_set_keymap('n', setting[1], setting[2], {}); end
      },
      {
        predicate = function(s) return s[3].mode == "insert"; end ,
        and_then = function(s) vim.api.nvim_set_keymap('i', setting[1], setting[2], {}); end
      },
      {
        predicate = function(s) return s[3].mode == "visual"; end ,
        and_then = function(s) vim.api.nvim_set_keymap('v', setting[1], setting[2], {}); end
      },
    })
  end
)

