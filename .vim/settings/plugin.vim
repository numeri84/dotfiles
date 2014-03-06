" ~~~~~~~~~
" プラグイン自体の設定たち
"


"
" neocomplete
"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
	\ 'scheme' : $HOME.'/.gosh_completions'
	\ }

" 
" neosnippet
"
let s:default_snippet = neobundle#get_neobundle_dir() . '/neosnippet/autoload/neosnippet/snippets' " 本体に入ってるやつ
let s:my_snippet = '~/.vim/snippets' " 自分のやつ
let g:neosnippet#snippets_directory = s:my_snippet
let g:neosnippet#snippets_directory = s:default_snippet . ',' . s:my_snippet

imap <silent><C-F> <Plug>(neosnippet_expand_or_jump)
inoremap <silent><C-U> <ESC>:<C-U>Unite snippet<CR>
nnoremap <silent><Space>e :<C-U>NeoSnippetEdit -split<CR>
smap <silent><C-F> <Plug>(neosnippet_register_oneshot_snippet)

"
" Unite
"
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200

"
" VimFiler
"
let g:vimfiler_as_default_explorer = 1
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
    nmap <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
endfunction

"
" VimShell
"
let g:vimshell_prompt = "% "
let g:vimshell_secondary_prompt = "> "
let g:vimshell_user_prompt = 'getcwd()'

"
" previm
"
"let g:previm_open_cmd = 'open -a Safari'

"
" jedi.vim
"
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

"" neocompleteとの連携
autocmd FileType python setlocal omnifunc=jedi#completions
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
let g:jedi#popup_on_dot = 1


"
" vim-rails
"

" :Rc (:Rm :Rv) hoge で開く
autocmd User Rails.controller* Rnavcommand api app/controllers/api -glob=**/* -suffix=_controller.rb
autocmd User Rails.controller* Rnavcommand tmpl app/controllers/tmpl -glob=**/* -suffix=_controller.rb
autocmd User Rails Rnavcommand config config  -glob=*.*  -suffix= -default=routs.rb
autocmd User Rails nmap :<C-u>Rcontroller :<C-u>Rc
autocmd User Rails nmap :<C-u>Rmodel :<C-u>Rm
autocmd User Rails nmap :<C-u>Rview :<C-u>Rv

"
" emmet
"
let g:user_emmet_settings = {
\    'lang' : 'ja'
\ }

" 
" switch
"
nnoremap <Space>m :<C-u>Switch<CR>
if filereadable(expand('~/.vim/settings/switch/switch_settings.vim'))
    source ~/.vim/settings/switch/switch_settings.vim
end

" 
" NERD-Tree
"

nnoremap :nt :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1 " 隠しファイルを表示

" 
" evervim
"
python sys.path.append('/usr/local/lib/python2.7/site-packages')

let g:evervim_devtoken='S=s43:U=45339f:E=14bba5b1e5a:C=14462a9f25e:P=1cd:A=en-devtoken:V=2:H=3190c5db6bee397dc764040ffe57e4d8'

" 
" clang_complete
"
let g:clang_complete_getopts_ios_default_options = '-fblocks -fobjc-arc -D __IPHONE_OS_VERSION_MIN_REQUIRED=40300'
let g:clang_complete_getopts_ios_sdk_directory = '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk'
let g:clang_complete_getopts_ios_ignore_directories = ["^\.git", "\.xcodeproj"]

