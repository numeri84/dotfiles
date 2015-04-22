" key remap settings

" ~~~~~~~~~
" Plugin key-mappings

if neobundle#is_installed('neocomplete')
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
elseif neobundle#is_installed('neocomplcache')
    " ~~~~~~~~~
    " neocomplcache
    inoremap <expr><C-g>	neocomplcache#undo_completion()
    "inoremap <expr><C-l>	neocomplcache#complete_common_string()
    
    " Recommended key-mappings
    " <CR>: close popup and save indent
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
    	return pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
    endfunction
    
    " <TAB>: completion
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    
    " <C-h>, <BS>: close popup and delete backword char
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplcache#close_popup()
    inoremap <expr><C-e> neocomplcache#cancel_popup()
endif


" ~~~~~~~~~
" Unite.vim remaps
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap sT :<C-u>Unite tab<CR>

" ~~~~~~~~~
" Unite-rails
noremap :ur :<C-u>Unite rails/root<CR>
noremap :urc :<C-u>Unite rails/controller<CR>
noremap :urco :<C-u>Unite rails/controller<CR>
noremap :urm :<C-u>Unite rails/model<CR>
noremap :urv :<C-u>Unite rails/view<CR>
noremap :urh :<C-u>Unite rails/helper<CR>
noremap :url :<C-u>Unite rails/log<CR>
noremap :urb :<C-u>Unite rails/bundle<CR>
noremap :urr :<C-u>Unite rails/route<CR>
noremap :urd :<C-u>Unite rails/db<CR>
noremap :urdb :<C-u>Unite rails/db<CR>
noremap :urj :<C-u>Unite rails/javascript<CR>
noremap :urjs :<C-u>Unite rails/javascript<CR>
noremap :urcss :<C-u>Unite rails/stylesheets<CR>
noremap :urcn :<C-u>Unite rails/config<CR>
noremap :urs :<C-u>Unite rails/spec<CR>

nnoremap <silent> ,urc :<C-u>Unite rails/controller<CR>
nnoremap <silent> ,urco :<C-u>Unite rails/controller<CR>
nnoremap <silent> ,urm :<C-u>Unite rails/model<CR>
nnoremap <silent> ,urv :<C-u>Unite rails/view<CR>
nnoremap <silent> ,urh :<C-u>Unite rails/helper<CR>
nnoremap <silent> ,url :<C-u>Unite rails/log<CR>
nnoremap <silent> ,urb :<C-u>Unite rails/bundle<CR>
nnoremap <silent> ,urr :<C-u>Unite rails/route<CR>
nnoremap <silent> ,urd :<C-u>Unite rails/db<CR>
nnoremap <silent> ,urdb :<C-u>Unite rails/db<CR>
nnoremap <silent> ,urj :<C-u>Unite rails/javascript<CR>
nnoremap <silent> ,urjs :<C-u>Unite rails/javascript<CR>
nnoremap <silent> ,urcss :<C-u>Unite rails/stylesheet<CR>
nnoremap <silent> ,urcn :<C-u>Unite rails/config<CR>
nnoremap <silent> ,urs :<C-u>Unite rails/spec<CR>

" ~~~~~~~~~
" VimFiler remaps
nnoremap <silent> ,vf :<C-u>VimFiler<CR>

" ~~~~~~~~~
" unite-ssh remaps

" ~~~~~~~~~
" previm remaps
nnoremap <silent> ,pv :<C-u>PrevimOpen<CR>

" ~~~~~~~~~
" evervim remaps
nnoremap <silent> ,el :<C-u>EvervimNotebookList<CR>
nnoremap <silent> ,en :<C-u>EvervimCreateNote<CR>

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



