-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map gt to :tabnext<CR> and gT to :tabprevious<CR>
vim.keymap.set("n", "gt", ":tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "gT", ":tabprevious<CR>", { desc = "Previous Tab" })
-- Enter and shift+enter in normal mode put a blank line above or below the cursor
vim.keymap.set("n", "<CR>", "o<ESC>", { desc = "Insert newline below" })
vim.keymap.set("n", "<S-CR>", "O<ESC>", { desc = "Insert newline above" })

-- leader + yank to copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
-- leader + paste to paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<leader>P", '"+P', { desc = "Paste from clipboard" })

-- <leader>di - Disable intellisense
-- :lua require('cmp').setup.buffer { enabled = false }<CR>
vim.keymap.set("n", "<leader>di", function()
  local bufnr = vim.api.nvim_get_current_buf()

  -- Stop LSP clients for the current buffer
  for _, client in pairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    client.stop()
  end

  -- Disable GitHub Copilot for the current buffer
  vim.cmd("Copilot disable")

  -- Disable LuaSnip for the current buffer
  local ok, luasnip = pcall(require, "luasnip")
  if ok then
    luasnip.cleanup() -- Clear active snippets
    luasnip.disable() -- Disable LuaSnip globally
    vim.api.nvim_buf_set_var(bufnr, "luasnip_disabled", true) -- Mark it disabled for this buffer
  end

  -- Notify the user
  vim.notify("Intellisense, Copilot, and Snippets disabled for the current buffer", vim.log.levels.INFO)
end, { desc = "Disable Intellisense, Copilot, and Snippets for current buffer" })

-- Instead of 0 always going to the start of the line, go to the first non-blank character
vim.keymap.set("n", "0", "^", { desc = "Go to first non-blank character" })
-- space in normal mode maps to zz
vim.keymap.set("n", "<space>", "zz", { desc = "Center the screen on the cursor" })

-- Move lines up and down in normal mode with leader + j and leader + k
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", { desc = "Move line up" })

-- <leader>dws removes whitespace from otherwise empty lines
vim.keymap.set("n", "<leader>dws", ":%s/\\s\\+$//e<CR>", { desc = "Remove whitespace from empty lines" })
-- <leader>dbl deletes blank lines
vim.keymap.set("n", "<leader>dbl", ":%g/^$/d<CR>", { desc = "Delete blank lines" })
vim.keymap.set("v", "<leader>dbl", ":g/^$/d<CR>", { desc = "Delete blank lines in selection" })

-- <leader>tn creates a new tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })

-- gg should go to the beginning of the file, at the first column
vim.keymap.set("n", "gg", "gg0", { desc = "Go to the beginning of the file" })
-- G should go to the end of the file, at the first column
vim.keymap.set("n", "G", "G0", { desc = "Go to the end of the file" })

-- <leader>fth to set the filetype to html
vim.keymap.set("n", "<leader>fth", ":set ft=html<CR>", { desc = "Set filetype to HTML" })
-- <leader>ftj to set the filetype to javascript
vim.keymap.set("n", "<leader>ftj", ":set ft=javascript<CR>", { desc = "Set filetype to JavaScript" })
-- <leader>ftc to set the filetype to css
vim.keymap.set("n", "<leader>ftc", ":set ft=css<CR>", { desc = "Set filetype to CSS" })
-- <leader>fts to set the filetype to sql
vim.keymap.set("n", "<leader>fts", ":set ft=sql<CR>", { desc = "Set filetype to SQL" })
-- <leader>+ calls vim math plugin
vim.keymap.set("n", "<leader>+", "vipy:call VMATH_Analyse()<cr>", { desc = "Call VMATH_Analyse()" })
vim.keymap.set("v", "<leader>+", "y:call VMATH_Analyse()<cr>", { desc = "Call VMATH_Analyse()" })

-- <leader>fj to format json
vim.keymap.set("n", "<leader>fj", function()
  -- Perform JSON formatting if the file type is JSON
  if vim.lsp.buf.format then
    -- Use LSP formatting
    vim.lsp.buf.format({ async = true })
  else
    -- Fallback to external tool if no LSP formatting is available
    local cmd = "jq ."
    vim.cmd("%! " .. cmd)
  end

  -- Wait for the formatting to complete (optional delay if needed)
  vim.defer_fn(function()
    -- Perform gg=G for additional indentation fixes
    local curpos = vim.fn.getpos(".")
    vim.cmd("normal! gg=G")
    vim.fn.setpos(".", curpos)
    print("JSON formatted and indented")
  end, 100) -- Adjust delay if necessary
end, { desc = "Format JSON and fix indentation" })

vim.keymap.set("n", "<leader>fh", function()
  -- Always use Prettier with the HTML parser
  vim.cmd("%!prettier --parser html")
  print("Formatted as HTML")
end, { desc = "Format buffer as HTML with Prettier" })

vim.keymap.set("v", "<leader>fh", function()
  -- Get the selected range
  local start_pos = vim.fn.getpos("'<")[2]
  local end_pos = vim.fn.getpos("'>")[2]

  -- Run Prettier on the selected range with HTML parser
  vim.cmd(start_pos .. "," .. end_pos .. "!prettier --parser html")
  print("Formatted selection as HTML")
end, { desc = "Format selection as HTML with Prettier" })
