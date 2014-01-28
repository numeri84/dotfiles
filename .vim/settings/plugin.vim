" ~~~~~~~~~
" プラグイン自体の設定たち
"


"
" neocomplcache
"
let g:acp_enableAtStartup=0 " Disable AutoComplPop
let g:neocomplcache_enable_at_startup=0 " 起動時に有効にする => 切りましたンゴ
let g:neocomplcache_min_syntax_length=3 " 補完対象となるキーワードの最小長さ
let g:neocomplcache_lock_buffer_name_pattern='\*ku\*' " neocomplcacheを自動的にロックするバッファ名のパターン
let g:neocomplcache_enable_ignore_case=1 " 補完候補検索時に、大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case=1 " 入力に大文字が使用されている場合、大文字小文字の区別をする

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
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : ''
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
"let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
" VimShell
let g:vimshell_prompt = "% "
let g:vimshell_secondary_prompt = "> "
let g:vimshell_user_prompt = 'getcwd()'

"
" previm
"
" let g:previm_open_cmd = 'open -a safari'

"
" jedi.vim
"
autocmd Filetype python setlocal omnifunc=jedi#completions
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
let g:jedi#popup_select_first = 0
let g:jedi#auto_initialization = 1
"let g:jedi#popup_on_dot = 1
let g:jedi#auto_vim_configuration = 1

set runtimepath+=~/dotfiles/.vim/after/ftplugin/

"
" vim-rails
"


"
" Hybridtext
"
au BufRead,BufNewFile *.txt set syntax=hybrid

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
