-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/himanoa/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/himanoa/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/himanoa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/himanoa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/himanoa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["alp-vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/alp-vim",
    url = "/home/himanoa/src/github.com/alp-inc/z-labo-himanoa/alp-vim"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["bloop-vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/bloop-vim",
    url = "https://github.com/nocksock/bloop-vim"
  },
  ["caw.vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/caw.vim",
    url = "https://github.com/tyru/caw.vim"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["denite-git"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/denite-git",
    url = "https://github.com/chemzqm/denite-git"
  },
  ["denite.nvim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/denite.nvim",
    url = "https://github.com/Shougo/denite.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fern.vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/fern.vim",
    url = "https://github.com/lambdalisue/fern.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf-preview.vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/fzf-preview.vim",
    url = "https://github.com/yuki-yano/fzf-preview.vim"
  },
  goshiteki = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/goshiteki",
    url = "https://github.com/himanoa/goshiteki"
  },
  ["iceberg.vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/iceberg.vim",
    url = "https://github.com/cocopon/iceberg.vim"
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/lexima.vim",
    url = "https://github.com/cohama/lexima.vim"
  },
  ["lightline-gitdiff"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/lightline-gitdiff",
    url = "https://github.com/niklaas/lightline-gitdiff"
  },
  ["lightline.vim"] = {
    config = { "\27LJ\2\nð\21\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Ð\21      let g:lightline#gitdiff#indicator_added = '+'\n      let g:lightline#gitdiff#indicator_deleted = '-'\n      let g:lightline#gitdiff#separator = ' '\n      let g:lightline = {\n              \\ 'colorscheme': 'wombat',\n              \\ 'mode_map': {'c': 'NORMAL'},\n              \\ 'active': {\n              \\   'left': [ [ 'branchname' ], [ 'filename' ], ['gitdiff'] ],\n              \\   'right': [ ['filetype'], ['lineinfo'] ]\n              \\ },\n              \\ 'component_function': {\n              \\   'modified': 'LightlineModified',\n              \\   'readonly': 'LightlineReadonly',\n              \\   'fugitive': 'LightlineFugitive',\n              \\   'filename': 'LightlineFilename',\n              \\   'branchname': 'LightlineBranchname'\n              \\ },\n              \\ 'component': {\n              \\   'gitstatus': '%<%{lightline_gitdiff#get_status()}',\n              \\ },\n              \\ 'component_expand': {\n              \\   'gitdiff': 'lightline#gitdiff#get'\n              \\ },\n              \\ 'component_type': {\n              \\   'gitdiff': 'middle'\n              \\ },\n              \\ 'component_visible_condition': {\n              \\   'gitstatus': 'lightline_gitdiff#get_status() !=# \"\"',\n              \\ },\n              \\ }\n\n      function! LightlineModified()\n        return &ft =~ 'help\\|vimfiler\\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'\n      endfunction\n\n      function! LightlineReadonly()\n        return &ft !~? 'help\\|vimfiler\\|gundo' && &readonly ? 'x' : ''\n      endfunction\n\n      function! LightlineFilename()\n        return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .\n              \\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :\n              \\  &ft == 'unite' ? unite#get_status_string() :\n              \\  &ft == 'vimshell' ? vimshell#get_status_string() :\n              \\ '' != expand('%:t') ? expand('%') : '[No Name]') .\n              \\ ('' != LightlineModified() ? ' ' . LightlineModified() : '')\n      endfunction\n\n      function! LightlineFugitive()\n        if &ft !~? 'vimfiler\\|gundo' && exists('*FugitiveHead')\n          return FugitiveHead()\n        else\n          return ''\n        endif\n      endfunction\n\n      function! LightlineFileformat()\n        return winwidth(0) > 70 ? &fileformat : ''\n      endfunction\n\n      function! LightlineFiletype()\n        return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''\n      endfunction\n\n      function! LightlineFileencoding()\n        return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''\n      endfunction\n\n      function! LightlineMode()\n        return winwidth(0) > 60 ? lightline#mode() : ''\n      endfunction\n\n      function! LightlineBranchname()\n        return gitbranch#name()\n      endfunction\n    \bcmd\bvim\0" },
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/lightline.vim",
    url = "https://github.com/itchyny/lightline.vim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neomake = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/neomake",
    url = "https://github.com/neomake/neomake"
  },
  ["neomru.vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/neomru.vim",
    url = "https://github.com/Shougo/neomru.vim"
  },
  ["nisha-vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/nisha-vim",
    url = "https://github.com/heraldofsolace/nisha-vim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\ni\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["operator-camelize.vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/operator-camelize.vim",
    url = "https://github.com/tyru/operator-camelize.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["patchreview-vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/patchreview-vim",
    url = "https://github.com/junkblocker/patchreview-vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÎ\5\0\0\6\0\25\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\18\0005\3\14\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\15\0035\4\16\0=\4\17\3=\3\19\0025\3\21\0005\4\20\0=\4\22\3=\3\23\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\24\0'\2\22\0B\0\2\1K\0\1\0\19load_extension\15extensions\bfzf\1\0\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\1\rdefaults\1\0\0\17path_display\1\2\0\0\rtruncate\18layout_config\1\0\1\fpreview\1\rvertical\1\0\4\nwidth\4š³æÌ\t™³¦ÿ\3\20prompt_position\vbottom\19preview_cutoff\3(\vheight\4Í™³æ\fÌ™³ÿ\3\15horizontal\1\0\4\nwidth\4š³æÌ\t™³¦ÿ\3\20prompt_position\vbottom\19preview_cutoff\3x\vheight\4Í™³æ\fÌ™³ÿ\3\vcursor\1\0\3\nwidth\4š³æÌ\t™³¦ÿ\3\19preview_cutoff\3(\vheight\4Í™³æ\fÌ™³ÿ\3\vcenter\1\0\4\nwidth\4\0€€€ÿ\3\20prompt_position\btop\19preview_cutoff\3(\vheight\4š³æÌ\t™³æþ\3\16bottom_pane\1\0\0\1\0\3\20prompt_position\btop\19preview_cutoff\3x\vheight\3\25\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["textobj-verticalbar"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/textobj-verticalbar",
    url = "https://github.com/vim-scripts/textobj-verticalbar"
  },
  ultisnips = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-bufkill"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-bufkill",
    url = "https://github.com/qpkorr/vim-bufkill"
  },
  ["vim-colors-pencil"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-colors-pencil",
    url = "https://github.com/reedes/vim-colors-pencil"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-endwise",
    url = "https://github.com/tpope/vim-endwise"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gh-line"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-gh-line",
    url = "https://github.com/ruanyl/vim-gh-line"
  },
  ["vim-gitbranch"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-gitbranch",
    url = "https://github.com/itchyny/vim-gitbranch"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-github-link"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-github-link",
    url = "https://github.com/knsh14/vim-github-link"
  },
  ["vim-graphql"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-graphql",
    url = "https://github.com/jparise/vim-graphql"
  },
  ["vim-hier"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-hier",
    url = "https://github.com/jceb/vim-hier"
  },
  ["vim-kalisi"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-kalisi",
    url = "https://github.com/freeo/vim-kalisi"
  },
  ["vim-operator-surround"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-operator-surround",
    url = "https://github.com/rhysd/vim-operator-surround"
  },
  ["vim-operator-user"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-operator-user",
    url = "https://github.com/kana/vim-operator-user"
  },
  ["vim-slim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-slim",
    url = "https://github.com/slim-template/vim-slim"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-textobj-comment"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-textobj-comment",
    url = "https://github.com/glts/vim-textobj-comment"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter",
    url = "https://github.com/sgur/vim-textobj-parameter"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-vue"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/vim-vue",
    url = "https://github.com/posva/vim-vue"
  },
  ["yaml.vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/yaml.vim",
    url = "https://github.com/tmsanrinsha/yaml.vim"
  },
  ["yats.vim"] = {
    loaded = true,
    path = "/home/himanoa/.local/share/nvim/site/pack/packer/start/yats.vim",
    url = "https://github.com/HerringtonDarkholme/yats.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lightline.vim
time([[Config for lightline.vim]], true)
try_loadstring("\27LJ\2\nð\21\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Ð\21      let g:lightline#gitdiff#indicator_added = '+'\n      let g:lightline#gitdiff#indicator_deleted = '-'\n      let g:lightline#gitdiff#separator = ' '\n      let g:lightline = {\n              \\ 'colorscheme': 'wombat',\n              \\ 'mode_map': {'c': 'NORMAL'},\n              \\ 'active': {\n              \\   'left': [ [ 'branchname' ], [ 'filename' ], ['gitdiff'] ],\n              \\   'right': [ ['filetype'], ['lineinfo'] ]\n              \\ },\n              \\ 'component_function': {\n              \\   'modified': 'LightlineModified',\n              \\   'readonly': 'LightlineReadonly',\n              \\   'fugitive': 'LightlineFugitive',\n              \\   'filename': 'LightlineFilename',\n              \\   'branchname': 'LightlineBranchname'\n              \\ },\n              \\ 'component': {\n              \\   'gitstatus': '%<%{lightline_gitdiff#get_status()}',\n              \\ },\n              \\ 'component_expand': {\n              \\   'gitdiff': 'lightline#gitdiff#get'\n              \\ },\n              \\ 'component_type': {\n              \\   'gitdiff': 'middle'\n              \\ },\n              \\ 'component_visible_condition': {\n              \\   'gitstatus': 'lightline_gitdiff#get_status() !=# \"\"',\n              \\ },\n              \\ }\n\n      function! LightlineModified()\n        return &ft =~ 'help\\|vimfiler\\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'\n      endfunction\n\n      function! LightlineReadonly()\n        return &ft !~? 'help\\|vimfiler\\|gundo' && &readonly ? 'x' : ''\n      endfunction\n\n      function! LightlineFilename()\n        return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .\n              \\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :\n              \\  &ft == 'unite' ? unite#get_status_string() :\n              \\  &ft == 'vimshell' ? vimshell#get_status_string() :\n              \\ '' != expand('%:t') ? expand('%') : '[No Name]') .\n              \\ ('' != LightlineModified() ? ' ' . LightlineModified() : '')\n      endfunction\n\n      function! LightlineFugitive()\n        if &ft !~? 'vimfiler\\|gundo' && exists('*FugitiveHead')\n          return FugitiveHead()\n        else\n          return ''\n        endif\n      endfunction\n\n      function! LightlineFileformat()\n        return winwidth(0) > 70 ? &fileformat : ''\n      endfunction\n\n      function! LightlineFiletype()\n        return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''\n      endfunction\n\n      function! LightlineFileencoding()\n        return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''\n      endfunction\n\n      function! LightlineMode()\n        return winwidth(0) > 60 ? lightline#mode() : ''\n      endfunction\n\n      function! LightlineBranchname()\n        return gitbranch#name()\n      endfunction\n    \bcmd\bvim\0", "config", "lightline.vim")
time([[Config for lightline.vim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÎ\5\0\0\6\0\25\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\18\0005\3\14\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\15\0035\4\16\0=\4\17\3=\3\19\0025\3\21\0005\4\20\0=\4\22\3=\3\23\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\24\0'\2\22\0B\0\2\1K\0\1\0\19load_extension\15extensions\bfzf\1\0\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\1\rdefaults\1\0\0\17path_display\1\2\0\0\rtruncate\18layout_config\1\0\1\fpreview\1\rvertical\1\0\4\nwidth\4š³æÌ\t™³¦ÿ\3\20prompt_position\vbottom\19preview_cutoff\3(\vheight\4Í™³æ\fÌ™³ÿ\3\15horizontal\1\0\4\nwidth\4š³æÌ\t™³¦ÿ\3\20prompt_position\vbottom\19preview_cutoff\3x\vheight\4Í™³æ\fÌ™³ÿ\3\vcursor\1\0\3\nwidth\4š³æÌ\t™³¦ÿ\3\19preview_cutoff\3(\vheight\4Í™³æ\fÌ™³ÿ\3\vcenter\1\0\4\nwidth\4\0€€€ÿ\3\20prompt_position\btop\19preview_cutoff\3(\vheight\4š³æÌ\t™³æþ\3\16bottom_pane\1\0\0\1\0\3\20prompt_position\btop\19preview_cutoff\3x\vheight\3\25\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\ni\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'emmet-vim'}, { ft = "vue" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
