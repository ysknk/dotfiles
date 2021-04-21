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
# Path to your nodebrew.
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Path dotfiles
export DOTFILES_DIR=$HOME/dotfiles
