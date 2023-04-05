local options = {
  backup = false,                          -- creates a backup file
  --clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = false,                        -- highlight all matches on previous search pattern
  lazyredraw = true,                       -- Don't refresh screen until finished drawing changes
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = true,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = false,                       -- Use tabs instead of spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- Uses less real estate than 4
  cursorline = false,                      -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                             -- wrap long lines
  scrolloff = 4,                           -- is one of my fav
  sidescrolloff = 8,
  autoindent = true,
  copyindent = true,
  hidden = true,
  guifont = "Monaco for Powerline:h13",    -- the font used in graphical neovim applications
  --guifont = "Hack NF:h13",    -- the font used in graphical neovim applications
  --guifont = "Consolas:h13",    -- the font used in graphical neovim applications
  --guifont = "CaskaydiaCove NF:h13",    -- the font used in graphical neovim applications
  --guifont = "UbuntuMono NF:h14",    -- the font used in graphical neovim applications
  wildignore = "*.swp,*.zip,*.exe,*.dll,*.cs,*.edmx,*.png,*.jpg,*.tt,*.pdb,*.svg,*.csproj,*.sln,*\\tmp\\*,*/tmp/*,*\\node_modules\\*,*/node_modules/*",
  laststatus = 2,
}


--vim.g["ctrlp_custom_ignore"] = "node_modules\\|DS_Store\\|git|\\v[\\/]\\.(git|hg|svn|swo|swp)$"
vim.cmd [[
 let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$|.dll|.cs|.edmx|.map|.rdlc'
  \ }
]]
vim.g["airline_theme"] = "solarized"
vim.g["neovide_cursor_animation_length"] = 0.07
vim.g["neovide_cursor_trail_size"] = 0.1
vim.g["neovide_cursor_animate_command_line"] = false

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end


--vim.cmd "set whichwrap+=<,>,[,],h,l"
--vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd [[
  if ! exists("g:CheckUpdateStarted")
      let g:CheckUpdateStarted=1
      call timer_start(1,'CheckUpdate')
  endif
  function! CheckUpdate(timer)
      silent! checktime
      call timer_start(1000,'CheckUpdate')
  endfunction
]]

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost options.lua source <afile>
  augroup end

  augroup cdpwd
      autocmd!
      autocmd VimEnter * cd $PWD
  augroup END
]]


-- 0.06 cursor animation length
-- 0.7  trail size
