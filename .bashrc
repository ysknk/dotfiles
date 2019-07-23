os=${OSTYPE//[0-9.-]*/}
case "$os" in
  # mac
  darwin)
    if [[ -d /Applications/MacVim.app ]]; then # MacVimが存在するならば
      alias vim = /Applications/MacVim.app/Contents/MacOS/Vim
      alias vi = vim
    fi
    ;;
  # windows
  msys)
    os="windows"
    PATH = "C:\\msys64\\usr\\bin\\:$PATH"
    ;;
  # linux
  linux)
    os="linux"
    ;;
  # other
  *)

  echo "Unknown Operating system $OSTYPE"
  exit 1
esac

