" Window and OS settings
set nocompatible
set langmenu=en_US
let $LANG='en_US'
syntax on                           " Enable syntax highlighting
behave xterm                        " Alternative: mswin
set hidden                          " Automatically set buffer hidden when editing new buffers
set go=gcrLteAb                     " Gray menu items (g), use console dialogs (c), right-hand scrollbar (r), left-hand scrollbar on vertical split (L), tearoff menu items (t), add tab pages (e), copy in visual mode uses clipboard (Aa)
set showtabline=1                   " Show tabs when available
set cmdheight=2                     " 2 commandline lines (reduces 'press enter' messages)
set showcmd                         " Shows incomplete commands and displays the number of selected characters / lines in visual mode
set laststatus=2                    " Always show status line
set display=lastline                " Show incomplete last lines
set sidescroll=1                    " Do not jump when scrolling right, scroll char by char
set scrolloff=3                     " Always keep 3 lines below or above cursor in view
set sidescrolloff=3                 " Always keep 3 characters left or right from cursor in view
set guifont=Consolas:h10:cANSI:qDRAFT
" set guifont=Cascadia_Code:h10:cANSI:qDRAFT
if !exists("g:done_vimrc") && has("gui_running")
	set lines=40 columns=160        " Create a bigger window when starting
	" au GUIEnter * simalt ~x       " Maximize vim when starting
	let g:done_vimrc = 1
endif
set number                          " Line numbers
" set relativenumber
set backspace=indent,eol,start      " Enable backspace removing indentation, end of lines and characters before edit start point
set clipboard=unnamed               " Always use * register for clipboard operations
set history=1000                    " Keep history of n edits
set viminfo='100,<50,s10,h,n$userprofile/_viminfo
set autochdir                       " Automatically chdir to buffer
set linebreak                       " Break lines after words rather than characters (given 'wrap' is on)
set splitright                      " Put new split windows right
set splitbelow                      " Put new split windows below
set showmatch                       " Show matching brackets
set incsearch                       " Search for pattern while typing
set hlsearch                        " Highlight search matches (toggle with <C-k>)
set ignorecase                      " Don't consider case when searching (with smartcase exception)
set smartcase                       " Only consider case when there's an upper case letter in search string
set fileformats=unix,dos            " Use Unix linebreaks for default
set isfname-={,},:                  " When editing tex files, enable vim to "gf" to file in statements like \include{<file>}
set encoding=utf-8                  " Set default encoding to UTF-8
set fileencodings=ucs-bom,utf-8,default,latin1
set wildignore+=*.class,*.dvi,*.aux,*.ps,*.pdf      " Add these extensions (+=) to list of ignored files when pressing tab key for auto completion
set formatoptions=tcroqnlj          " Format options: t=auto wrap, croj=comment leader, q=format comments, n=number, l=keep long lines
set autoindent                      " Copy indentation from previous line
set nocindent                       " Indent behaviour for { } /* */ ( ) ...
set nosmartindent                   " Similar to cindent (This is only effective if nocindent)
set smartindent                     " Similar to cindent (This is only effective if nocindent)
set shiftwidth=0                    " Indentation width
set tabstop=4                       " Note: Setting 'tabstop' to any other value than 8 can make your file appear wrong in many places (e.g., when printing it)
set softtabstop=0                   " Turn off mixture of spaces and tabs
set noexpandtab                     " Don't expand tabs to spaces
set nosmarttab                      " Delete tab width spaces when using spaces for indentation
set nojoinspaces                    " Don't put two spaces when joining lines [or when autoformatting (set fo+=a), gq etc.] behind . ! ?
set confirm                         " ask to save unsaved buffers instead of fail
set statusline=%1*%.10Y\ %2*%.60F%1*\ [%M%R]\ [buf\ %3*%n%1*]\ [0x%B]\ [%3*%3l,%3c%1*]\ [offset:\ %o,\ %p%%]\ %{&endofline?'':'[noeol]'}


" Colors
" Shift+F7 / Shift+F8 to flip through colorschemes.
" Some colorschemes support both light and dark backgrounds; for those, the desired mode is read from g:default_background.
" Set g:default_background to 'light' or 'dark' to force a preference, or leave it empty to capture &background on the first toggle.
"
" light: default delek morning peachpuff shine zellner
" dark: blue darkblue desert elflord evening habamax industry koehler murphy pablo ron slate sorbet torte unokai zaibatsu
" both: catppucchin lunaperche quiet retrobox wildcharm
let g:default_background = ''
let g:colors = getcompletion('', 'color')

func! NextColor()
    let idx = index(g:colors, g:colors_name, 0, 1)
    return (idx + 1 >= len(g:colors) ? g:colors[0] : g:colors[idx + 1])
endfunc
func! PrevColor()
    let idx = index(g:colors, g:colors_name, 0, 1)
    return (idx - 1 < 0 ? g:colors[-1] : g:colors[idx - 1])
endfunc

function! s:ChangeColor(name)
    if empty(g:default_background)
        let g:default_background = &background
    endif
    let &background = g:default_background
    execute 'colorscheme ' . a:name
endfunction

nnoremap <S-F7> :call <SID>ChangeColor(PrevColor())<CR>:echo g:colors_name .. ' (g:default_background=' .. g:default_background .. ')'<CR>
nnoremap <S-F8> :call <SID>ChangeColor(NextColor())<CR>:echo g:colors_name .. ' (g:default_background=' .. g:default_background .. ')'<CR>

function! Colors()
    hi! User1 guifg=black guibg=#8c99b2 ctermfg=white ctermbg=blue
    hi! User2 guifg=white guibg=#8c99b2 ctermfg=white ctermbg=darkblue
    hi! User3 guifg=black guibg=#8c99b2 ctermfg=white ctermbg=blue
    hi! LineNr guifg=#555555
    hi! EndOfBuffer guifg=#555555
    if &background == "dark"
        hi! Normal guibg=#20202b
    else
        hi! Normal guibg=#FFFFFF
    endif
endfunction

augroup MyColors
    autocmd!
    autocmd VimEnter,Syntax,ColorScheme,FileType,SourcePost * call Colors()
augroup END


" Hotkeys
" -------
ino <S-CR>   <ESC>o " insert mode: shift-enter → insert line below
ino <C-S-CR> <ESC>O " insert mode: ctrl-shift-enter → insert line above
nno <C-k>    :set hls!<CR> " normal mode: ctrl-k toggle search result highlighting
vno <Tab> >gv " visual mode: tab - indent visually
vno <S-Tab> <gv " visual mode: shift tab - unindent visually
" normal mode, and no tabs: ctrl pageup/pagedown: cycle buffers
nno <C-PageUp>   :silent if tabpagenr("$") == 1 \| bp \| else \| tabp \| endif<CR>
nno <C-PageDown> :silent if tabpagenr("$") == 1 \| bn \| else \| tabn \| endif<CR>
" F12 read vimrc shift F12 edit vimrc
let g:my_vimrc =
  \   filereadable($MYVIMRC)         ? $MYVIMRC
  \ : filereadable('/etc/vim/vimrc') ? '/etc/vim/vimrc'
  \ : filereadable($VIM . '/_vimrc') ? $VIM . '/_vimrc'
  \ : ''

nnoremap <F12>   :execute 'source ' . g:my_vimrc<CR>
nnoremap <S-F12> :execute 'edit '   . g:my_vimrc<CR>

nno <c-q> :qall<CR>

autocmd FileType sh                             nnoremap <buffer> <F11> :silent! write!<CR>:execute '!bash ' . shellescape(expand('%'))<CR>
autocmd FileType php,python,ruby,perl,lua,java  nnoremap <buffer> <F11> :silent! write!<CR>:execute '!' . &filetype . ' ' . shellescape(expand('%'))<CR>


" Automation
" ----------
"
" Detect filetype after saving file
au BufWritePost * filetype detect

" When editing a file, always jump to the last known cursor position. Don't do
" it when the position is invalid or when inside an event handler (happens
" when dropping a file on gvim). Also don't do it when the mark is in the
" first line, that is the default position when opening a file.
autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

" In diff mode, start maximized and equal sizes
if has("gui_running")
	if &diff
		autocmd VimResized * wincmd =
		autocmd GuiEnter * simalt ~x
	endif
endif

" Wipe empty buffers when opening a buffer
function! CleanEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
    if !empty(buffers)
        exe 'bw ' . join(buffers, ' ')
    endif
endfunction
au BufEnter * silent call CleanEmptyBuffers()

" Strip trailing whitespace on save
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre python,php,java :call <SID>StripTrailingWhitespaces()


" Filetypes
" ---------
"
filetype plugin indent on           " Execute scripts from ftplugin directories


" text files
au BufNewFile,BufRead *.tex  setlocal expandtab textwidth=80 nocin nosi formatoptions=tcql grepprg=grep\ -nH\ $*
au BufNewFile,BufRead *.txt  setlocal nocin nosi

" close { automatically
let g:filetype_inc="php"
au Filetype php        inoremap <buffer> { {<CR>}<ESC>O
au FileType javascript inoremap <buffer> { {<CR>}<ESC>O
au FileType java       inoremap <buffer> { {<CR>}<ESC>O

" Python
au FileType  python    set expandtab tabstop=4 shiftwidth=4 softtabstop=-1 smarttab

" Java
autocmd FileType java   :iabbr sout System.out.println();<left><left>



" Plugins
" -------
"
" Search visual selection
" visual mode: * and #
vnoremap <silent> * :<C-U>
			\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
			\gvy/<C-R><C-R>=substitute(
			\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
			\gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
			\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
			\gvy?<C-R><C-R>=substitute(
			\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
			\gV:call setreg('"', old_reg, old_regtype)<CR>

" Tabularize
"
" visual mode: (shift) tab
inoremap <silent> <S-Tab> <TAB><Esc>:call <SID>ealign()<CR>a
function! s:ealign()
	let p = '^.*        \s.*$'
	if exists(':Tabularize') && getline('.') =~# '^.*    ' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^ ]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.* \s*\zs.*'))
		Tabularize/    /l1
		normal! 0
		call search(repeat('[^ ]*           ',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction


" SQL
"
" stop some sql plugin annoyances
let g:omni_sql_no_default_maps = 1

" Log file analysis
"
" visual mode: d, D
vnoremap d :<C-U>echo RemoveSelectionFromBuffer(0)<CR>
vnoremap D :<C-U>echo RemoveSelectionFromBuffer(1)<CR>
function! GetVisualSelection()
	if mode() == "v"
		let [line_start, column_start] = getpos("v")[1:2]
		let [line_end, column_end] = getpos(".")[1:2]
	else
		let [line_start, column_start] = getpos("'<")[1:2]
		let [line_end, column_end] = getpos("'>")[1:2]
	end
	if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
		let [line_start, column_start, line_end, column_end] =
					\   [line_end, column_end, line_start, column_start]
	end
	let lines = getline(line_start, line_end)
	if len(lines) == 0
		return ''
	endif
	let lines[-1] = lines[-1][: column_end - 1]
	let lines[0] = lines[0][column_start - 1:]
	return lines
endfunction

" Removes lines matching the selected text from buffer.
function! RemoveSelectionFromBuffer(ignoreNumbers)
	let lines = GetVisualSelection() " selected lines
	" Escape backslashes and slashes (delimiters)
	call map(lines, {k, v -> substitute(v, '\\\|/', '\\&', 'g')})
	if a:ignoreNumbers == 1
		" Substitute all numbers with \s*\d\s* - in formatted output matching
		" lines may have whitespace instead of numbers. All backslashes need
		" to be escaped because \V (very nomagic) will be used.
		call map(lines, {k, v -> substitute(v, '\s*\d\+\s*', '\\s\\*\\d\\+\\s\\*', 'g')})
	endif
	let blc = line('$') " number of lines in buffer (before deletion)
	let vlc = len(lines) " number of selected lines
	let pattern = join(lines, '\_.') " support multiline patterns
	let cmd = ':g/\V' . pattern . '/d_' . vlc " delete matching lines (d_3)
	let pos = getpos('v') " save position
	execute "silent " . cmd
	call setpos('.', pos) " restore position
	let dlc = blc - line('$') " number of deleted lines
	let dmc = dlc / vlc " number of deleted matches
	let cmd = substitute(cmd, '\(.\{50\}\).*', '\1...', '') " command output
	let lout = dlc . ' line' . (dlc == 1 ? '' : 's')
	let mout = '(' . dmc . ' match' . (dmc == 1 ? '' : 'es') . ')'
	return printf('%s removed: %s', (vlc == 1 ? lout : lout . ' ' . mout), cmd)
endfunction

if exists('*plug#begin')
  call plug#begin()

  Plug 'fenjen/vim-plugin-vry'

  call plug#end()
endif
