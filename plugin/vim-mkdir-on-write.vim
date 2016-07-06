" Automatically create all required parent directories when saving a file
" Shamelessly stolen from "ZyX" on Stack Overflow:
" http://stackoverflow.com/a/4294176/417040

" TODO: Maybe add error handling.
" TODO: Add a configurable feature to first ask the user before creating dirs.

function! s:MkNonExDir(file, buf)
	if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
		let dir=fnamemodify(a:file, ':h')
		if !isdirectory(dir)
			call mkdir(dir, 'p')
		endif
	endif
endfunction
augroup MkdirOnWrite
	autocmd!
	autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
