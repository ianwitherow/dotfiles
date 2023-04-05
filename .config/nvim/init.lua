require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"

-- Use leader as prefix for camelcasemotion
vim.fn['camelcasemotion#CreateMotionMappings']('<leader>')

vim.lsp.set_log_level("debug")
