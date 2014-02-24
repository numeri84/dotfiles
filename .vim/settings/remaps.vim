" key remap settings

" ~~~~~~~~~
" Plugin key-mappings

" ~~~~~~~~~
" neocomplete
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
" <TAB>: completeion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"


"" ~~~~~~~~~
"" neocomplcache
"inoremap <expr><C-g>	neocomplcache#undo_completion()
""inoremap <expr><C-l>	neocomplcache#complete_common_string()
"
"" Recommended key-mappings
"" <CR>: close popup and save indent
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"	return pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
"endfunction
"
"" <TAB>: completion
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"
"" <C-h>, <BS>: close popup and delete backword char
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y> neocomplcache#close_popup()
"inoremap <expr><C-e> neocomplcache#cancel_popup()



" ~~~~~~~~~
" Unite.vim remaps
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" ~~~~~~~~~
" VimFiler remaps
nnoremap <silent> ,vf :<C-u>VimFiler<CR>

" ~~~~~~~~~
" unite-ssh remaps

" ~~~~~~~~~
" previm remaps
nnoremap <silent> ,pv :<C-u>PrevimOpen<CR>

" ~~~~~~~~~
" 自分が使いやすいリマップ関連

set whichwrap=b,s,h,l,<,>,[,]           " カーソルを行頭、行末で止まらないようにする

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
"inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-f> <Right>
inoremap <C-h> <BS>
inoremap <C-b> <Left>
inoremap <C-d> <Del>
inoremap <C-e> <Esc>A

" <Space><Space>で.vimrc再読み込み
nnoremap <Space><Space> :source ~/.vimrc<CR>

" ~~~~~~~~~
" evervim remaps
nnoremap <silent> ,el :<C-u>EvervimNotebookList<CR>
nnoremap <silent> ,en :<C-u>EvervimCreateNote<CR>

