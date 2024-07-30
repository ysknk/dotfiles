# Get the aliases and functions
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi

# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt ignoreeof
# カッコの対応などを自動的に補完
setopt auto_param_keys
# ビープを鳴らさない
setopt nobeep
# cd した先のディレクトリをディレクトリスタック（履歴）に追加する
# `cd +<Tab>` でディレクトリの履歴（新しい順）が表示され、そこに移動できる
setopt auto_pushd
# 同じディレクトリを pushd しない
setopt pushd_ignore_dups
# 他のターミナルとヒストリーを共有
setopt share_history
# ヒストリーに重複を表示しない
setopt histignorealldups
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="wedisagree"

# If you come from bash you might have to change your $PATH.
# export PATH=/Applications/MacVim.app/Contents/MacOS:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Path to your vim.
# export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
# zlib
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/sqlite/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/sqlite/lib/pkgconfig"
source $ZSH/oh-my-zsh.sh

# Show Current Dir
export PS1="%F{red}[%2d] "

# alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
# alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
# alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
# alias vi=vim

# Use Colors
autoload -U colors
colors

# Use Comp
# autoload -U compinit
# compinit

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

