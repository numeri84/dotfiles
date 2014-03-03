""""""""""""""""""""""""""""" 
" @numeri84 vim settings
"
" hoge
"
"""""""""""""""""""""""""""""


" ~~~~~~~~~
" default setting
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
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\
                                        " ステータスラインにエンコーディング、
                                        " フォーマット表示
" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

set autoindent          " autoindentを有効にする
set smartindent         " 新しい行を開始した時にインデントを揃える
set shiftwidth=4        " インデント幅
set tabstop=4            " tab幅
set expandtab           " ソフトタブを有効に

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


" ~~~~~~~~~
" neobundle
set nocompatible
filetype off

set rtp+=~/dotfiles/neobundle.vim

if has('vim_starting')
    "set runtimepath+=~/.vim/bundle/neobundle.vim/
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
    
endif

" ~~~~~~~~~
" plugin settings
"
if filereadable(expand('~/.vim/neobundle_settings.vim'))
    source ~/.vim/neobundle_settings.vim
endif

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
autocmd FileType c,cpp
autocmd BufNewFile,BufRead *.cu set filetype=c "*.cuファイルをCファイルとして認識
set cindent

autocmd BufNewFile,BufRead *.md set filetype=Markdown
" autocmd BufNewfile,BufRead *.txt set filetype=hybrid

"if filereadable(expand('~/.vim/settings/filetype.vim'))
"    source ~/.vim/settings/filetype.vim
"endif

