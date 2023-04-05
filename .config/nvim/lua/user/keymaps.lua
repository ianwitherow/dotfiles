local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Use comma as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = " "
vim.g.NERDTreeMapHelp = "<F1>"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<leader>e", ":Lex 30<cr>", opts)
keymap("n", "0", "^", opts) -- 0 goes to the first nonblank character (ignores leading whitespace)
keymap("n", ")", "0", opts) -- Shift+0 goes to the actual beginning of the line
keymap("n", "<space>", "zz", opts) -- Space centers the screen around the current line
keymap("n", "<leader>cd", ":cd %:p:h<CR>:NERDTreeCWD<CR>:NERDTreeClose<CR>", opts) -- Change directory to current path, and set nerdtree's directory as well
keymap("n", "<leader>nf", ":NERDTreeFind<CR>", opts) -- Show the current file in nerdtree
keymap("n", "<F2>", ":NERDTreeToggle<CR>", opts) -- Toggle nerdtree
keymap("n", "<Enter>", "o<Esc>", opts) -- Enter in normal mode inserts a new line below cursor
keymap("n", "<S-Enter>", "O<Esc>", opts) -- Shift+Enter in normal mode inserts a new line above cursor
keymap("n", "<C-l>", ":noh<cr>:redraw<cr>", opts) -- Shift+Enter in normal mode inserts a new line above cursor
keymap("n", "<leader>j", ":m .+1<CR>==", opts) -- Move the line down
keymap("n", "<leader>k", ":m .-2<CR>==", opts) -- Move the line up
keymap("n", "<C-s>", ":w<cr>", opts) -- Save the file with ctrl+s
keymap("n", "<C-p>", ":Files<cr>", opts)
keymap("n", "<C-b>", ":History<cr>", opts)
keymap("n", "<C-g>", ":Rg<cr>", opts)
keymap("n", "<leader>dws", "ma:%s/^\\s*$// g<CR>:%s/\\s\\+$// e<CR>`a", opts) -- Make empty lines ACTUALLY empty (removes lines with just whitespace, and trailing whitespace)
keymap("n", "<leader>dbl", ":g/^\\s*$/d_<cr>``", opts) -- Delete empty lines
keymap("n", "<leader>ddbl", ":g/\\(^\\s*$\\n\\)\\{2}/normal \"_dd<cr>``", opts) -- Collapse mulpitle empty lines into a single empty line
keymap("n", "<leader>+", "vipy:call VMATH_Analyse()<cr>", opts)  -- Vimath plugin - does some math stuff on lists of numbers
keymap("n", "<leader>tn", ":tabnew<cr>", opts) -- Open a new tab
keymap("n", "<leader>rc", ":edit $MYVIMRC<cr>", opts) -- Easy VIMRC editing
keymap("n", "<leader>ex", ":silent !explorer.exe /select, \"%:p\"<cr>", opts) -- Open current file location in windows explorer
keymap("n", "<leader>dm", ":%s/\\r\\(\\n\\)/\\1/g<CR>``", opts) -- Remove ^M characters visual studio likes to make
keymap("n", "<leader>fc", ":%s#:\\@<!\\/\\/\\([^ ]\\)#// \\1<CR>", opts) -- Fix js comments. Turns //This  into  // This


keymap("n", "<leader>vs", ":silent execute '!launch_vscode.sh \"%:p\" \"'.line('.').'\" \"'.col('.').'\"'<CR>", opts)

--keymap("n", "<leader>vsc", ":execute \":!echo \" . line('.')<CR>", opts)


keymap("n", "gg", "gg0", opts) -- gg should go to the beginning of the file
-- keymap("n", "%%", "$%", opts) -- Double pressing % goes to the end of the line first. Useful for functions e.g., function() { /* new line */ }
keymap("n", "g%", "$%", opts) -- Goes to the end of the line first. Useful for functions e.g., function() { /* new line */ }

-- Format JSON and JS
keymap("n", "<Leader>fj", ":%!python -m json.tool<CR>:set ft=javascript<CR>", opts)
keymap("n", "<Leader>fjs", ":call JsBeautify()<cr>", opts)

-- Format xml/html
keymap("n", "<leader>fx", ":set filetype=xml<cr>:%s/</\\r</g<CR>:%s/>/>\\r/g<CR>:g/^\\s*$/d<CR>gg=G", opts)
keymap("n", "<leader>fX", ":set filetype=xml<cr>:%s/^\\s\\+// e<CR>ggVGgJ0", opts)


-- Sideways.vim - move parameters inside a method left or right
--keymap("n", "<leader>h", ":SidewaysLeft<cr>", opts) 
--keymap("n", "<leader>l", ":SidewaysRight<cr>", opts) 
-- Create 'argument' text object - a
keymap("o", "aa", "<Plug>SidewaysArgumentTextobjA", opts)
keymap("x", "aa", "<Plug>SidewaysArgumentTextobjA", opts)
keymap("o", "ia", "<Plug>SidewaysArgumentTextobjI", opts)
keymap("x", "ia", "<Plug>SidewaysArgumentTextobjI", opts)


-- copy/paste to os clipboard
keymap("v", "<Leader>y", "\"*y", opts)
keymap("n", "<Leader>y", "\"*y", opts)
keymap("n", "<Leader>p", "\"*p", opts)
keymap("v", "<Leader>p", "\"*p", opts)
keymap("n", "<Leader>P", "\"*P", opts)
keymap("v", "<Leader>P", "\"*P", opts)

-- Quick file type changing
keymap("n", "<leader>ftj", ":set ft=javascript<CR>", opts)
keymap("n", "<leader>fth", ":set ft=html<CR>", opts)
keymap("n", "<leader>ftc", ":set ft=css<CR>", opts)
keymap("n", "<leader>ftx", ":set ft=xml<CR>", opts)
keymap("n", "<leader>fts", ":set ft=sql<CR>", opts)
keymap("n", "<leader>ftv", ":set ft=vbnet<CR>", opts)

-- Disable intellisense
keymap("n", "<leader>di", ":lua require('cmp').setup.buffer { enabled = false }<CR>", opts)

-- For saving/reading git notes from a text file (avoid copy/paste weirdness into terminal)
keymap("n", "<leader>sgn", ":w! c:\\temp\\gitnotes.txt<cr>", opts)
keymap("n", "<leader>rgn", ":.-1read c:\\temp\\gitnotes.txt<cr>", opts)
keymap("n", "<leader>sgl", ":w! c:\\temp\\gitnotes.txt<cr>", opts)
keymap("n", "<leader>rgl", ":.-1read c:\\temp\\gitnotes.txt<cr>", opts)

-- Visual --
keymap("v", "// ", "y/<C-R>\"<cr>", opts) -- Search for visually selected text
keymap("v", "<leader>br", "mt:s/<[^>]*>/\\r&\\r/g<CR>`tdd=atvat:g/^$/d<CR>:noh<CR>}ddkvato<Esc>", opts) -- Break up html
keymap("v", "<leader>+", "y:call VMATH_Analyse()<cr>", opts) -- Vimath plugin - does some math stuff on lists of numbers

-- Stay in indent mode
--keymap("v", "<", "<gv", opts)
--keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)


-- Visual Block --
-- Move text up and down
keymap("x", "<leader>j", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<leader>k", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)




-- Insert Mode --
keymap("i", "<S-Enter>", "<Enter><Esc>O", opts) -- Split up HTML tag and put cursor inside (Used when cursor is like this: <div>|</div>)
keymap("i", "<C-v>", "<c-r>*", opts) -- Let ctrl+v paste in insert mode

