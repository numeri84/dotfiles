"
" NeoBundleでプラグインうんたらかんたら

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'basyura/unite-rails'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler.vim'
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
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'thinca/vim-showtime'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'kakkyz81/evervim'

"" clang
NeoBundle 'git://github.com/Rip-Rip/clang_complete.git'
NeoBundle 'git://github.com/tokorom/clang_complete-getopts-ios.git'

NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'cohama/vim-smartinput'
NeoBundle 'cohama/vim-smartinput-endwise'
NeoBundle 'hail2u/vim-css3-syntax'

"" js
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'moll/vim-node'
NeoBundle 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'mattn/jscomplete-vim'

NeoBundle 'sudo.vim'
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

"" elixir
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'carlosgaldino/elixir-snippets'

" for Haskell
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'eagletmt/ghcmod-vim'

" for scala
NeoBundle 'derekwyatt/vim-scala'

NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

if neobundle#exists_not_installed_bundles()
	echomsg 'Not installed bundles : ' .
		\ string(neobundle#get_not_installed_bundle_names())
	echomsg 'Please execute ":NeoBundleInstall" command.'
endif


