if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    au BufNewFile,BufRead *.php   setlocal tabstop=4 shiftwidth=4
    au FileType c,cpp
    au BufNewFile,BufRead *.cu set filetype=c "*.cuファイルをCファイルとして認識
    set cindent

    au BufNewFile,BufRead *.md set filetype=Markdown
    au BufNewFile,BufRead *.tex,*.latex,*.sty,*.dtx,*.ltx,*bbl setf tex
    " autocmd BufNewfile,BufRead *.txt set filetype=hybrid

    au BufNewFile,BufRead *.erl set tabstop=4 shiftwidth=4

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    "let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
augroup end
