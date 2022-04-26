set number                     " Line numbers
set linebreak                  " Break line without break word
set linespace=2
set nobackup                   " Dont save backup~ files
set ignorecase                 " Ignore case when searching
set smartcase                  " Override ignorecase when pattern contains a capital letter
set incsearch                  " Find results as you type
set ai                         " Autoindent
set copyindent
set backspace=indent,eol,start " Visual studio backspace thing for the extensiont
set shiftwidth=3 tabstop=3     " Uses less real estate than 4
set noexpandtab                " Don't use spaces
set guioptions-=m              " Remove menu
set guioptions-=T              " Remove toolbar
set guioptions-=r              " Remove scroll bar
set directory=~/.vim/swp       " Put .swp files here
set nrformats=                 " Treat all numbers as decimal
set lazyredraw                 " When running macros, wait until it's done and then update the screen. way faster
set noshowmatch
set hidden                     " Allow switching buffers even if it's not saved yet
set rnu                        " relative line numbers
set nohlsearch                 " Don't highlight search queries
set path+=**                   " Search down into subfolders
set wildmenu                   " Display all matching files when we tab complete

"set guifont=Monaco\ for\ Powerline:h11:cANSI
set guifont=Mononoki:h12
"set guifont=Fira\ Mono\ for\ Powerline:h11:cANSI
"set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h13
"set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono\ Windows\ Compatible:h13
"set guifont=SauceCodePro\ Nerd\ Font:h13
set guifont=CascadiaCode\ Nerd\ Font:h12:cANSI


let mapleader=','

"Syntax highlighting
syntax on

" vim-plug stuff
filetype off
set rtp+=$HOME/.vim
call plug#begin('c:\Users\dave\.vim\plugged')

Plug 'ianwitherow/vim-dracula'          " colorscheme
Plug 'bluz71/vim-moonfly-colors'        " colorscheme
Plug 'rakr/vim-one'                     " colorscheme
Plug 'morhetz/gruvbox'                  " colorscheme
Plug 'mhartington/oceanic-next'         " colorscheme
Plug 'sickill/vim-monokai'              " colorscheme
Plug 'aonemd/kuroi.vim'                 " colorscheme
Plug 'ianwitherow/onedark.vim'          " colorscheme

Plug 'kien/ctrlp.vim'
Plug 'chrisbra/csv.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'cohama/lexima.vim'
Plug 'docunext/closetag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'mjbrownie/swapit'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'bkad/CamelCaseMotion'             " use ,<motion> to move in camelcase
Plug 'gregsexton/MatchTag'
Plug 'scrooloose/nerdtree'              " File browsing
Plug 'ianwitherow/vim-vmath'            " Lets you do <leader>+ to math some numbers
Plug 'mattn/emmet-vim'                  " New zen-coding
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'hail2u/vim-css3-syntax'
Plug 'dhruvasagar/vim-table-mode'
Plug 'groenewege/vim-less'
Plug 'mbbill/undotree'
Plug 'AndrewRadev/sideways.vim'
Plug 'othree/yajs.vim'                  " javascript, es6/react stuff
Plug 'mxw/vim-jsx'                      " React syntax
Plug 'othree/es.next.syntax.vim'        " es7 syntax
Plug 'tpope/vim-jdaddy'                 " JSON text object stuff
Plug 'tommcdo/vim-lion'                 " align code with gl<motion><letter>, like glip=
Plug 'PProvost/vim-ps1'                 " Powershell support

Plug 'kkoenig/wimproved.vim'            " Fixes gvim issues like window bar color
Plug 'yegappan/mru'                     " Plugin for recently edited files

Plug 'MarcWeber/vim-addon-mw-utils'     " Dependency for snipmate
Plug 'tomtom/tlib_vim'                  " Dependency for snipmate
Plug 'garbas/vim-snipmate'              " Snippets

Plug 'honza/vim-snippets'
Plug 'christianrondeau/vim-base64'

Plug 'mhinz/vim-startify'               " Start page for vim
Plug 'azzoam/FixGVimBorder'

                                        " Use gr{motion} to replace with text in register. For a specific register, use "xgr{motion}
Plug 'vim-scripts/ReplaceWithRegister' 

Plug 'vim-utils/vim-space'              " Whitespace text object

call plug#end()

"colorscheme gruvbox
"colorscheme OceanicNext
"colorscheme monokai
"colorscheme moonfly
colorscheme onedark

filetype plugin indent on


"Auto commands

"ASP.NET files that should act like HTML
au BufNewFile,BufRead *.aspx,*.ascx,*.master,*.cshtml set filetype=html
au BufNewFile,BufRead *.js,*.jsx set fileformat=unix

"Start in full screen
"au GUIEnter * simalt ~x
"au GUIEnter * silent! WToggleClean


"For some reason I have to manually load the css color script
au Filetype html,css source ~\.vim\after\syntax\css.vim

"Allows % to move between braces in inline css
au filetype html let b:match_debug=1

"Fixes brace matching in script tags inside HTML files
"let b:match_debug=1

"Load .vimrc after saving it
au! BufWritePost .vimrc source $MYVIMRC

" Use leader as prefix for camelcasemotion
call camelcasemotion#CreateMotionMappings('<leader>')

"turn off stupid bell sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

"_____________________________________________________
"----------------------Mappings-----------------------
"_____________________________________________________

"Have 0 go to first nonblank character
nmap 0 ^

"Space centers the screen
nmap <space> zz

"Double ESC turns off seach highlighting
nmap <silent> <ESC><ESC> :noh<CR>

"Save with Ctrl+S for when I want to save with one hand
nmap <c-s> :w<cr>

"Ctrl-L unhighlights as well as redraws the screen
nnoremap <silent> <c-l> :noh<cr>:redraw<cr>

"New lines while staying in normal mode
nmap <Enter> o<Esc>
nmap <S-Enter> O<Esc>

"Set j and k to go down a line even on a wrapped line
nmap j gj
nmap k gk

"Make empty lines ACTUALLY empty (removes lines with just whitespace, and trailing whitespace)
nmap <leader>dws ma:%s/^\s*$//g<CR>:%s/\s\+$//e<CR>`a

"Delete empty lines
nmap <leader>dbl :g/^\s*$/d<cr>``

nmap <leader>ddbl :g/\(^\s*$\n\)\{2}/normal dd<cr>``

"Vimath plugin - does some math stuff on lists of numbers
vmap <leader>+ y:call VMATH_Analyse()<cr>
nmap <leader>+ vip++

"Open a new tab
nmap <leader>tn :tabnew<CR>

"Easy VIMRC editing
map <leader>rc :edit $MYVIMRC<CR>

" Switch CWD to the directory of the open buffer
nnoremap <silent> <leader>cd :cd %:p:h<CR>:NERDTreeCWD<CR>:NERDTreeClose<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>

"Open current file location in windows explorer
map <leader>ex :silent !explorer.exe /select, "%:p"<cr>
"Open current file location in chrome
map <leader>chr :silent !chrome.exe "%:p"<cr>



"Set a URL to autoversion (.net)
map <leader>av cs"@i"<%=%><esc>F=aNew AutoVersion("<esc>f/dt@F";Pf)a.Write()<esc>f@df@

"Tableify the document (using tab as the delimiter), then copy it to clipboard
"map <leader>ft :%Tableize/\t<cr>ggyyppVr-gg.yyGpgg"*yG
map <leader>ft :%Tableize/\t<cr>:TableModeEnable<cr>ggo\|\|<esc>yyggPGpgg"*yG

"Y yanks from cursor to end of line
nnoremap Y y$

" move the current line up and down
nnoremap <leader>k      :m-2<CR>==
nnoremap <leader>j      :m+1<CR>==

"Remove ^M characters visual studio likes to make
nnoremap <leader>dm		:%s/\r\(\n\)/\1/g<CR>``

" isolate a line
nnoremap <leader><space><space> O<c-o>j<c-o>o<c-o>k<esc>

" Make switching buffers easier
nnoremap <c-j> <c-^>

"copy/paste to os clipboard
vnoremap <Leader>y "*y
nnoremap <Leader>y "*y
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p
nnoremap <Leader>P "*P
vnoremap <Leader>P "*P
nnoremap <Leader>d "*d
vnoremap <Leader>d "*d
nnoremap <Leader>D "*D

"Paste in visual mode without overwriting the buffer
vnoremap p "_dp
vnoremap P "_dP

"Search for visually selected text
vnoremap // y/<C-R>"<CR>

"Quick file type changing
nnoremap <leader>ftj :set ft=javascript<CR>
nnoremap <leader>fth :set ft=html<CR>
nnoremap <leader>ftc :set ft=css<CR>
nnoremap <leader>ftx :set ft=xml<CR>
nnoremap <leader>fts :set ft=sql<CR>
nnoremap <leader>ftv :set ft=vbnet<CR>

"Break up html
vnoremap <leader>br mt:s/<[^>]*>/\r&\r/g<CR>`tdd=atvat:g/^$/d<CR>:noh<CR>}ddkvato<Esc>

"Format JSON and JS
nnoremap <Leader>fj :%!python -m json.tool<CR>:set ft=javascript<CR>
nnoremap <Leader>fjs :call JsBeautify()<cr>

nnoremap <leader>fx :set filetype=xml<cr>:%s/</\r</g<CR>:%s/>/>\r/g<CR>:g/^\s*$/d<CR>gg=G
nnoremap <leader>fX :set filetype=xml<cr>:%s/^\s\+//e<CR>ggVGgJ0

"Fix js comments. Turns //This  into  // This
"Make sure a colon isn't before the slashes since that's probably a url

"nnoremap <leader>fc :%s#\([^:]\?\)//\([^\s]\)#\1// \2<CR>``
nnoremap <leader>fc :%s#:\@<!\/\/\([^ ]\)#// \1<CR><C-o>


"Split up HTML tag and put cursor inside (Used when cursor is like this: <div>|</div>)
imap <S-Enter> <Enter><Esc>O

"HTML attribute text object
omap aha :normal vaha<CR>
vnoremap aha :<C-U>silent! normal! vf";<CR>

"Copy the entire lines when grabbing html tags
nnoremap yat yVat``

"Sideways.vim - move parameters inside a method left or right
nnoremap <leader>h :SidewaysLeft<cr>
nnoremap <leader>l :SidewaysRight<cr>
"Create 'argument' text object - a
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

"UndoTree
nnoremap <F5> :UndotreeToggle<cr>

"Markdown preview
nmap <leader>md :%!c:\users\ianwi\.vim\Markdown.pl --html4tags <cr>

" Use tab and shift-tab to cycle through windows.
"nnoremap <Tab> <C-W>w
"nnoremap <S-Tab> <C-W>W
"
" Use | and _ to split windows (while preserving original behaviour of [count]bar and [count]_).
nnoremap <expr><silent> <Bar> v:count == 0 ? "<C-W>v<C-W><Right>" : ":<C-U>normal! 0".v:count."<Bar><CR>"
nnoremap <expr><silent> _     v:count == 0 ? "<C-W>s<C-W><Down>"  : ":<C-U>normal! ".v:count."_<CR>"

" cr<register> to edit a register. E.g., cra
nnoremap cr :call ChangeReg()<cr>

"_____________________________________________________
"----------------------End of Mappings-----------------------
"_____________________________________________________

"Get rid of those annoying underlines in HTML
let html_no_rendering=1
"use jsx settings for .js files also
let g:jsx_ext_required = 0

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'eslint'
"let g:syntastic_javascript_eslint_args = ['--fix']
"map <F3> :SyntasticReset<CR>



"Persist undo
let undo_dir = $TEMP."\\vimundo"
if !isdirectory(undo_dir)
	silent execute "!mkdir ".undo_dir
endif
set undodir=$TEMP\vimundo "not sure how to use the variable I made here
set undofile
set undolevels=100000


runtime macros/matchit.vim


" start page config
let g:startify_bookmarks = [
		\ { 'c': '~/.vimrc' },
		\ { 'r': '~/OneDrive - Source/Projects/Web/Source/Source.Web/apps/react' },
		\ ]

let g:startify_change_to_dir = 1
let g:startify_disable_at_vimenter = 1


"Ctrl-P stuff
"Ctrl+B opens CtrlP Buffer
nnoremap <silent> <c-b> :CtrlPBuffer<CR>

"<leader>mru opens Startify
nnoremap <silent> <leader>mru :Startify<CR>
let g:ctrlp_working_path_mode = 'c'

" cd into Source project directory
"nnoremap <silent> <leader>src :cd c:\Users\ianwi\OneDrive - Source\Projects\Web\Source<CR>:NERDTreeCWD<CR>:NERDTreeClose<CR>:Startify<CR>

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|\v[\/]\.(git|hg|svn|swo|swp)$'

"Gets a bunch of lines ready to be inserted into a table in sql
nnoremap  <leader>sql :call Sql()<cr>

":TOhtml options
let g:html_use_css = 1 "Use CSS instead of inline styles on each tag
let g:html_number_lines = 0 "Don't include line numbers


"For vim-airline
set encoding=utf-8 " Necessary to show Unicode glyphs
set laststatus=2
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_theme='solarized'

"BetterDigraphs
inoremap <expr>  <C-K>   BDG_GetDigraph()

" Let ctrl+v paste in insert mode
inoremap <C-v> <c-r>*

"NerdTree stuff
map <F2> :NERDTreeToggle<CR>
"Make it so ? doesn't open help
let NERDTreeMapHelp='<F7>'

set tags=tags;/

if !has("gui_running")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colorscheme kuroi
else
	set lines=50
	set columns=150
endif

call fixGVimBorder#auto()


function! FixBrackets()
	" Pulls up brackets that are on their own line
	" javascript
	silent :g/)$\n{/normal! J
	silent :g/)$\n\s.\{-}{/normal! J

	"css
	silent :g/[a-z]$\n{/normal J
	silent :g/)$\n{/normal J
	silent :g/[a-z]$\n\s.{-}{/normal J
	silent :g/[a-z]$\n^\s\+{/normal J
	silent :g/)$\n^\s\+{/normal J

endfunction

"Format document with HTML then open it in chrome
function! ToHtml()
	#silent :colorscheme solarized
	#silent :set background=light
	:TOhtml
	:w
	silent :!chrome %
	:q
endfunction

function! Sql()
	call inputsave()
	let tableName = input('Table name: ')
	call inputrestore() 

	silent

	if tableName == ""
		echo "Aborted"
		return
	endif

	let tableField = ""

	call inputsave()
	let createTable = input('Create table? (y/n): ')
	call inputrestore() 
	if createTable == "y"
		call inputsave()
		let tableField = input('Field names (comma separated): ')
		call inputrestore() 
	endif

	silent :execute "set filetype=sql"

	"Remove blank lines
	silent :execute ":g/^$/d"
	" Replace single quotes with two single quotes
	silent! :execute ":%s/'/''/ge"

	:silent %s/^/,('/ge
	:silent %s/\t/', '/ge
	:silent %s/$/')/ge
	silent :execute "noh"
	silent :execute "normal! gg"
	let timeout = 5
	let current = 0

	"Command to write the insert sql statement. Go to beginning of line,
	"delete the comma, insert new line above, write insert statement.
	"Finally, go 1001 lines down since SQL insert caps at 1000
	let insertSql = 'normal 0xOinsert into ' . tableName . ' values1001j0'

	silent :execute insertSql
	let curline = line('.')
	if curline != line('$')
		while curline + 1 != line('$') && curline != line('$')
			let current += 1
			let curline = line('.')
			if curline != line('$')
				silent :execute insertSql
			endif
		endwhile
	endif

	if tableField != ""
		:execute "normal! gg"
		let sql = "create table " . tableName . " ("
		for s:item in split(tableField, ',')
			let sql .= s:item . " varchar(500), "
		endfor
		let sql .= ")"
		let sql = substitute(sql, ", )", ")", "")
		:execute "normal! O"
		call setline('.', sql)
	endif

	:execute "normal! gg"
	normal! "*yG
endfunction


function! FixBMIHtml()
	silent :execute "%s/\\(<[A-Z].\\{-}>\\|<\\/[A-Z].\\{-}>\\)/\\L&/ge"
	silent :execute "%s/</\\r</ge"
	silent :execute "%s/>/>\\r/ge"
	silent :execute "g/^\\s*$/d"
	silent :execute "set filetype=html"

endfunction

function! FindDuplicates()
	call setreg("d", "")
	let lineCounts = {}
	let lineNum = 0
	let dupsCount = 0
	while lineNum <= line('$')
		let lineText = getline(lineNum)
		if lineText != ""
			let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
		endif
		let lineNum = lineNum + 1
	endwhile
	exe 'syn clear Repeat'
	for lineText in keys(lineCounts)
		if lineCounts[lineText] >= 2
			let dupsCount = dupsCount + 1
			call setreg("D", lineText."\n")   " Duplicate     --> register d
			exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
		endif
	endfor
	if dupsCount > 0
		highlight NormalUnderlined term=underline cterm=underline gui=underline
		echo "Found ".dupsCount." duplicate lines. They're in register "
		echohl NormalUnderlined
		echon "d"
		echohl NONE
	else
		echo "No duplicate lines found."
	endif
endfunction


function! EditMacro()
	let register = input('Register: ')

endfunction

fun! ChangeReg() abort
  let x = nr2char(getchar())
  call feedkeys("q:ilet @" . x . " = '\<c-r>\<c-r>=@" . x . "\<cr>'\<esc>0f'", 'n')
endfun
