"
" NeoBundleでプラグインうんたらかんたら

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-ssh'
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
NeoBundle 'Shougo/neocomplete'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'HybridText'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'thinca/vim-showtime'

filetype plugin indent on

if neobundle#exists_not_installed_bundles()
	echomsg 'Not installed bundles : ' .
		\ string(neobundle#get_not_installed_bundle_names())
	echomsg 'Please execute ":NeoBundleInstall" command.'
endif


