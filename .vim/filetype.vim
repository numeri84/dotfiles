if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	au BufNewFile,BufRead *.py	setlocal tabstop=4 shiftwidth=4 expandtab
augroup END

