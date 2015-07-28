""""""""""""""""""""""""""""" 
" @numeri84 vim settings
"
" hoge
"
"""""""""""""""""""""""""""""


" ~~~~~~~~~
" default setting
nnoremap : ;
nnoremap ; :

set runtimepath+=~/dotfiles/.vim/settings
set runtimepath+=~/dotfiles/.vim/after

set encoding=utf-8                      " デフォルトエンコーディング

set imdisable                           " 挿入モードから抜ける際にIMEをOff

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


" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

set clipboard+=unnamed                  " OSのクリップボードを使用
set laststatus=2                        " 常にステータスラインを表示
set ruler                               " カーソル位置
set showmatch                           " 括弧の対応をハイライト
set number                              " 行番号表示
set list                                " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:<       " 不可視文字の表示形式
set display=uhex                        " 印字不可能文字を16進数で表示
set cursorline                          " カーソル行をハイライト
set cursorcolumn
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\
                                        " ステータスラインにエンコーディング、
                                        " フォーマット表示
" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

set autoindent          " autoindentを有効にする
set smartindent         " 新しい行を開始した時にインデントを揃える
set shiftwidth=2        " インデント幅
set tabstop=2           " tab幅
set expandtab           " ソフトタブを有効に
set backspace=indent,eol,start  " バックスペースでインデントや改行を削除

" ESCキー2回押しで検索ハイライトを消去
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"" insertモード時、ステータスラインのカラーを変更
"augroup InsertHook
"autocmd!
"autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
"augroup END

" ~~~~~~~~~
" 色
if filereadable(expand('~/dotfiles/.vimrc.colors'))
    source ~/dotfiles/.vimrc.colors
endif

" IMEの状態に応じたカーソル色を設定
" 動いてない？
if has('multi_byte_ime') || has('xim')
    highlight CursorIM guifg=Orange guibg=NONE
endif

"
" 挿入モードの時の色指定
if !exists('g:hi_insert')
    let g:hi_insert = 'highlight StatusLine guifg=White guibg=DarkCyan gui=none ctermbg=DarkCyan cterm=none'
endif

if has('syntax')
    augroup InsertHook
        autocmd!
        autocmd InsertEnter * call s:StatusLine('Enter')
        autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
    if a:mode == 'Enter'
        silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
        silent exec g:hi_insert
    else
        highlight clear StatusLine
        silent exec s:slhlcmd
    endif
endfunction

function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
    return hl
endfunction

"
" カーソル移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" 
" ウィンドウ分割関連
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
" ウィンドウ間移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sw <C-w>w
" ウィンドウ移動
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sr <C-w>r
" タブ移動
nnoremap sn gt
nnoremap sp gT
" ウィンドウサイズ
nnoremap s= <C-w>=
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
" タブ関連？
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>



" ~~~~~~~~~
" neobundle
set nocompatible
filetype off

"set rtp+=~/dotfiles/neobundle.vim

if has('vim_starting')
    "set runtimepath+=~/.vim/bundle/neobundle.vim/
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
    if filereadable(expand('~/.vim/neobundle_settings.vim'))
        source ~/.vim/neobundle_settings.vim
    endif
    
endif

" ~~~~~~~~~
" plugin settings
"
if filereadable(expand('~/.vim/settings/plugin.vim'))
    source ~/.vim/settings/plugin.vim
endif

" ~~~~~~~~~
" key remapping settings

if filereadable(expand('~/.vim/settings/remaps.vim'))
    source ~/.vim/settings/remaps.vim
endif

" ~~~~~~~~~
" filetype settings

filetype on
filetype plugin on

"if filereadable(expand('~/.vim/settings/filetype.vim'))
"    source ~/.vim/settings/filetype.vim
"endif

