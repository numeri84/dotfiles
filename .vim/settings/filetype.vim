if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	au BufNewFile,BufRead *.py	setlocal tabstop=4 shiftwidth=4 expandtab
	au BufNewFile,BufRead *.rb	setlocal tabstop=2 shiftwidth=2 expandtab
	au BufNewFile,BufRead *.erb	setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

