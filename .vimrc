set encoding=utf-8                      " デフォルトエンコーディング

set nocompatible                        " vi互換なし
set noswapfile                          " スワップファイルを作らない
set backspace=indent,eol,start          " backspaceでなんでも削除
set formatoptions=lmoq                  " テキスト整形オプション
set vb t_vb=                            " ビープを鳴らさない
set showcmd                             " コマンドをステータス行に表示
set showmode                            " 現在のモードを表示
set title                               
set backupskip=/tmp/*,/private/tmp/*    " バックアップしない
set nobackup                            " 同上

syntax on

" OSのクリップボードを使用
set clipboard+=unnamed

" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

set laststatus=2                        " 常にステータスラインを表示
set ruler                               " カーソル位置
set showmatch                           " 括弧の対応をハイライト
set number                              " 行番号表示
set list                                " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:<       " 不可視文字の表示形式
set display=uhex                        " 印字不可能文字を16進数で表示
set cursorline                          " カーソル行をハイライト

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

set autoindent          " autoindentを有効にする
set smartindent         " 新しい行を開始した時にインデントを揃える
set shiftwidth=4        " インデント幅
set tabstop=4            " tab幅
"set expandtab           " ソフトタブを有効に

filetype on
autocmd FileType c,cpp
autocmd BufNewFile,BufRead *.cu set filetype=c "*.cuファイルをCファイルとして認識
set cindent

autocmd BufNewFile,BufRead *.md set filetype=markdown

source ~/dotfiles/.vimrc.colors

" insertモード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" neobundle
set nocompatible
filetype off

set rtp+=~/dotfiles/neobundle.vim

if has('vim_starting')
    "set runtimepath+=~/.vim/bundle/neobundle.vim/
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
    
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Lokaltog/powerline'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'FuzzyFinder'
NeoBundle 'L9'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'davidhalter/jedi-vim'

filetype plugin indent on

if neobundle#exists_not_installed_bundles()
	echomsg 'Not installed bundles : ' .
		\ string(neobundle#get_not_installed_bundle_names())
	echomsg 'Please execute ":NeoBundleInstall" command.'
endif

" neocomplcache
let g:acp_enableAtStartup=0 " Disable AutoComplPop
let g:neocomplcache_enable_at_startup=0 " 起動時に有効にする => 切りましたンゴ
let g:neocomplcache_min_syntax_length=3 " 補完対象となるキーワードの最小長さ
let g:neocomplcache_lock_buffer_name_pattern='\*ku\*' " neocomplcacheを自動的にロックするバッファ名のパターン
let g:neocomplcache_enable_ignore_case=1 " 補完候補検索時に、大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case=1 " 入力に大文字が使用されている場合、大文字小文字の区別をする

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
	\ 'scheme' : $HOME.'/.gosh_completions'
	\ }

" Define dictionary
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : ''
	\ }

" Plugin key-mappings
inoremap <expr><C-g>	neocomplcache#undo_completion()
"inoremap <expr><C-l>	neocomplcache#complete_common_string()

" Recommended key-mappings
" <CR>: close popup and save indent
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

set whichwrap=b,s,h,l,<,>,[,]           " カーソルを行頭、行末で止まらないようにする

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
"inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-h> <BS>
inoremap <C-b> <Left>

" Unite
"let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" VimShell
let g:vimshell_prompt = "% "
let g:vimshell_secondary_prompt = "> "
let g:vimshell_user_prompt = 'getcwd()'

" previm
" let g:previm_open_cmd = 'open -a safari'

" jedi.vim
autocmd Filetype python setlocal omnifunc=jedi#completions
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
let g:jedi#popup_select_first = 0
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 1
let g:jedi#auto_vim_configuration = 1

set runtimepath+=~/dotfiles/.vim/after/ftplugin/

