# for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# コマンド補完
autoload -U compinit
compinit -u

# 補完時に大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 言語設定
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# less設定
export LESS='-R'

# lscolor
export CLICOLOR=1
export LSCOLORS=ExFxCxdxBxegedabagacad

# 補完候補をカラー表示
zstyle ':completion:*' list-colors ''

# なんかちっちゃい設定
setopt auto_pushd # これまでに移動したディレクトリ一覧表示
setopt correct # コマンドミス訂正
setopt list_packed # 補完候補を詰めて表示
setopt nolistbeep # ビープ音を鳴らさない
setopt no_beep
setopt auto_cd # ディレクトリ名だけでcdできる
setopt auto_pushd # cd -[tab]で以前に居たディレクトリ補完
setopt no_flow_control # C-s, C-qを無効にする

# 履歴設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_all_dups
setopt hist_save_nodups
setopt hist_reduce_blanks
setopt share_history

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 古いコマンドと同じものは無視
setopt hist_save_no_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開
setopt hist_expand

# 履歴をインクリメンタルに追加
setopt inc_append_history

#履歴から検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# プロンプト評価
setopt prompt_subst
setopt transient_rprompt
# tmuxinator
#source ~/.tmuxinator/tmuxinator.zsh

#---------#
# (๑╹ڡ╹๑) #
#---------#

# alias settings
if [ -f ~/dotfiles/.zshrc.alias ]; then
    source ~/dotfiles/.zshrc.alias
fi

# path settings
if [ -f ~/dotfiles/.zshrc.env ]; then
    source ~/dotfiles/.zshrc.env
fi

# prompt settings
if [ -f ~/dotfiles/.zshrc.prompt ]; then
    source ~/dotfiles/.zshrc.prompt
fi
