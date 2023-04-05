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
local package_path_str = "/home/ian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  CamelCaseMotion = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/CamelCaseMotion",
    url = "https://github.com/bkad/CamelCaseMotion"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  MatchTag = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/MatchTag",
    url = "https://github.com/gregsexton/MatchTag"
  },
  ReplaceWithRegister = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/ReplaceWithRegister",
    url = "https://github.com/vim-scripts/ReplaceWithRegister"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["closetag.vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/closetag.vim",
    url = "https://github.com/docunext/closetag.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.lua"] = {
    commands = { "Copilot" },
    config = { "\27LJ\2\2„\4\0\0\4\0\16\0\0216\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\b\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2=\2\t\0015\2\n\0005\3\v\0=\3\5\2=\2\f\0015\2\r\0=\2\14\0014\2\0\0=\2\15\1B\0\2\1K\0\1\0\26server_opts_overrides\14filetypes\1\0\t\rhgcommit\1\bcvs\1\bsvn\1\rmarkdown\1\tyaml\1\thelp\1\6.\1\14gitrebase\1\14gitcommit\1\15suggestion\1\0\6\16accept_line\1\tprev\n<M-[>\tnext\n<M-]>\vaccept\n<M-l>\16accept_word\1\fdismiss\n<C-]>\1\0\3\17auto_trigger\1\rdebounce\3K\fenabled\2\npanel\1\0\1\25copilot_node_command\tnode\vlayout\1\0\2\nratio\4š³æÌ\t™³æþ\3\rposition\vbottom\vkeymap\1\0\5\topen\v<M-CR>\14jump_prev\a[[\frefresh\agr\vaccept\t<CR>\14jump_next\a]]\1\0\2\17auto_refresh\1\fenabled\2\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ian/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/csv.vim",
    url = "https://github.com/chrisbra/csv.vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["es.next.syntax.vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/es.next.syntax.vim",
    url = "https://github.com/othree/es.next.syntax.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["kuroi.vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/kuroi.vim",
    url = "https://github.com/aonemd/kuroi.vim"
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/lexima.vim",
    url = "https://github.com/cohama/lexima.vim"
  },
  mru = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/mru",
    url = "https://github.com/yegappan/mru"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/scrooloose/nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/scrooloose/nerdtree"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/oceanic-next",
    url = "https://github.com/mhartington/oceanic-next"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/onedark.vim",
    url = "https://github.com/ianwitherow/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["sideways.vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/sideways.vim",
    url = "https://github.com/AndrewRadev/sideways.vim"
  },
  swapit = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/swapit",
    url = "https://github.com/mjbrownie/swapit"
  },
  tabular = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  undotree = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/bling/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-base64"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-base64",
    url = "https://github.com/christianrondeau/vim-base64"
  },
  ["vim-css3-syntax"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-css3-syntax",
    url = "https://github.com/hail2u/vim-css3-syntax"
  },
  ["vim-dracula"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-dracula",
    url = "https://github.com/ianwitherow/vim-dracula"
  },
  ["vim-jdaddy"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-jdaddy",
    url = "https://github.com/tpope/vim-jdaddy"
  },
  ["vim-jsx"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-jsx",
    url = "https://github.com/mxw/vim-jsx"
  },
  ["vim-less"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-less",
    url = "https://github.com/groenewege/vim-less"
  },
  ["vim-lion"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-lion",
    url = "https://github.com/tommcdo/vim-lion"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/tpope/vim-markdown"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-misc",
    url = "https://github.com/xolox/vim-misc"
  },
  ["vim-monokai"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-monokai",
    url = "https://github.com/sickill/vim-monokai"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  },
  ["vim-notes"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-notes",
    url = "https://github.com/xolox/vim-notes"
  },
  ["vim-one"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-one",
    url = "https://github.com/rakr/vim-one"
  },
  ["vim-ps1"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-ps1",
    url = "https://github.com/PProvost/vim-ps1"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-vmath"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-vmath",
    url = "https://github.com/ianwitherow/vim-vmath"
  },
  ["wimproved.vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/wimproved.vim",
    url = "https://github.com/kkoenig/wimproved.vim"
  },
  ["xml.vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/xml.vim",
    url = "https://github.com/othree/xml.vim"
  },
  ["yajs.vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/yajs.vim",
    url = "https://github.com/othree/yajs.vim"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Copilot', function(cmdargs)
          require('packer.load')({'copilot.lua'}, { cmd = 'Copilot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'copilot.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Copilot ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
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
