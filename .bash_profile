case "$(uname)" in
    Darwin) # OSがMacならば
        if [[ -d /Applications/MacVim.app ]]; then # MacVimが存在するならば
            PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
        fi
        ;;

    *) ;; # OSがMac以外ならば何もしない
esac
