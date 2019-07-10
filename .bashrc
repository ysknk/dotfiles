export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

case "$(uname)" in
  Darwin) # OSがMacならば
    if [[ -d /Applications/MacVim.app ]]; then # MacVimが存在するならば
      alias vim = /Applications/MacVim.app/Contents/MacOS/Vim
      alias vi = vim
    fi
    ;;

  *) ;; # OSがMac以外ならば何もしない
esac

