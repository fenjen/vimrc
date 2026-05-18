colorscheme sorbet

set directory=$TEMP,c:\tmp,c:\temp,.

" Syntax highlight copy (Y in v mode)
function! HlCopy() range
	let g:html_font = "Consolas"
	let g:html_number_lines = 0
	exec a:firstline.','.a:lastline.'TOhtml'
	normal yG
	q!
	!start /min powershell "Get-Clipboard | Set-Clipboard -AsHtml"
	redraw
endfunction
vnoremap Y :call HlCopy()<CR>


" Change font size with ctrl+mousewheel
function! <SID>ChangeFontSize(delta)
	let l:font = &guifont
	let l:new = substitute(l:font, ':h\zs\d\+', '\=submatch(0) + a:delta', '')
	silent! let &guifont = l:new
	echo l:new
endfunction

nnoremap <C-ScrollWheelUp>   :call <SID>ChangeFontSize(1)<CR>:echo &guifont<CR>
nnoremap <C-ScrollWheelDown> :call <SID>ChangeFontSize(-1)<CR>:echo &guifont<CR>


function! s:SetRunMapping()
	if expand('%:p')[:4] == '\\wsl'
		nnoremap <buffer> <F11> :call RunWSL(&filetype, 1, 1, 1)<CR>
	else
		execute 'nnoremap <buffer> <F9> :silent! write!<CR>:execute "!" . &filetype . " " . shellescape(expand("%"))<CR>'
	endif
endfunction

autocmd FileType php,python,ruby,perl,lua,java call s:SetRunMapping()

function! s:InstallWSLMapping()
	if expand('%:p')[:4] == '\\wsl'
		let l:cmd = (&filetype ==# 'sh') ? 'bash' : &filetype
		execute 'nnoremap <buffer> <F9> :call <SID>RunWSL("' . l:cmd . '", 1, 1, 1)<CR>'
	endif
endfunction

autocmd FileType sh,php,python,ruby,perl,lua,java call s:InstallWSLMapping()

" Run scripts living on a WSL filesystem inside their distro instead of on Windows.
" Triggered for files opened via \\wsl$\... or \\wsl.localhost\... paths.
function! s:RunWSL(cmd, add_buffer_param, save_buffer, wait_for_keypress)
	if a:save_buffer | write | endif
	let l:buffer_name = substitute(fnamemodify(expand('%'), ':p'), '\\', '/', 'g')
	let l:match = matchlist(l:buffer_name, '^//[^/]\+/\([^/]\+\)\(/.*\)$')
	let l:distribution = l:match[1]
	let l:wsl_filename = l:match[2]
	let l:cmd_argument = a:add_buffer_param ? ' ' . shellescape(l:wsl_filename) : ''
	let l:wait_for_key  = a:wait_for_keypress ? '; read -n1' : ''
	let l:bashcmd = 'cd $(dirname ' . shellescape(l:wsl_filename) . ') ; '
	            \ . a:cmd . l:cmd_argument . l:wait_for_key
	let l:cmd = 'start wsl.exe -d ' . l:distribution . ' bash -ic "' . l:bashcmd . '"'
	execute 'silent !' . l:cmd
endfunction
