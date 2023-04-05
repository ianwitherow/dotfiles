local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  --use "ianwitherow/vim-dracula"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

	--use "github/copilot.vim" -- AI autocomplete
	use {
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require('copilot').setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>"
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = false,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = 'node', -- Node.js version must be > 16.x
				server_opts_overrides = {},
			})
		end,
	}

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer


  use 'ianwitherow/vim-dracula'          -- colorscheme
  use 'bluz71/vim-moonfly-colors'        -- colorscheme
  use 'rakr/vim-one'                     -- colorscheme
  use 'morhetz/gruvbox'                  -- colorscheme
  use 'mhartington/oceanic-next'         -- colorscheme
  use 'sickill/vim-monokai'              -- colorscheme
  use 'aonemd/kuroi.vim'                 -- colorscheme
  use 'ianwitherow/onedark.vim'          -- colorscheme

  -- ****************************************************************************************************
  -- FZF. Put this in ~/.zshrc:
  -- export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git --exclude node_modules'
  -- May need to install fdfind:  sudo apt install fd-find
  -- ****************************************************************************************************
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }

  use 'chrisbra/csv.vim'
  use 'jiangmiao/auto-pairs'
  use 'cohama/lexima.vim'
  use 'docunext/closetag.vim'
  use 'scrooloose/nerdcommenter'
  use 'mjbrownie/swapit'
  use 'bling/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'bkad/CamelCaseMotion'             -- use ,<motion> to move in camelcase
  use 'gregsexton/MatchTag'
  use 'scrooloose/nerdtree'              -- File browsing
  use 'ianwitherow/vim-vmath'            -- Lets you do <leader>+ to math some numbers
  use 'mattn/emmet-vim'                  -- New zen-coding
  use 'godlygeek/tabular'
  use 'tpope/vim-markdown'
  use 'hail2u/vim-css3-syntax'
  use 'dhruvasagar/vim-table-mode'
  use 'groenewege/vim-less'
  use 'mbbill/undotree'
  use 'AndrewRadev/sideways.vim'
  use 'othree/yajs.vim'                  -- javascript, es6/react stuff
  use 'mxw/vim-jsx'                      -- React syntax
  use 'othree/es.next.syntax.vim'        -- es7 syntax
  use 'othree/xml.vim'                   -- Useful xml/html stuff
  use 'tpope/vim-jdaddy'                 -- JSON text object stuff
  use 'tommcdo/vim-lion'                 -- align code with gl<motion><letter>, like glip=
  use 'PProvost/vim-ps1'                 -- Powershell support

  use 'kkoenig/wimproved.vim'            -- Fixes gvim issues like window bar color
  use 'yegappan/mru'                     -- Plugin for recently edited files


  use 'christianrondeau/vim-base64'

  use 'mhinz/vim-startify'               -- Start page for vim

  use 'vim-scripts/ReplaceWithRegister' 
  use 'xolox/vim-notes'
  use 'xolox/vim-misc'




  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

