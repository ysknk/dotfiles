# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Use Japanese
export LANG=ja_JP.UTF-8

# Path xdg
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/opt/openssl/bin:$PATH

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

# Path to your nodebrew.
# export PATH=$HOME/.nodebrew/current/bin:$PATH

# anyenv
if [ -e "$HOME/.anyenv" ]
then
  export ANYENV_ROOT=$HOME/.anyenv
  export PATH=$ANYENV_ROOT/bin:$PATH
  if command -v anyenv 1>/dev/null 2>&1; then
    eval "$(anyenv init -)"
  fi
fi

# nodenv
# if [ -e "$HOME/.nodenv" ]
# then
#   export NODENV_ROOT=$HOME/.anyenv/envs/nodenv
#   export PATH=NODENV_ROOT/bin:$PATH
#   export PATH=NODENV_ROOT/shims:$PATH
#   if command -v nodenv 1>/dev/null 2>&1; then
#     eval "$(nodenv init - --no-rehash)"
#   fi
# fi

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Path java
# export JAVA_HOME=$(/usr/libexec/java_home)

# Path dotfiles
export DOTFILES_DIR=$HOME/dotfiles

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT=$HOME/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
    source "${VIRTUAL_ENV}/bin/activate"
  fi
fi

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"
