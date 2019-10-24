export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

os=${OSTYPE//[0-9.-]*/}
case "$os" in
  # mac
  darwin)
    if [[ -d /Applications/MacVim.app ]]; then # MacVimが存在するならば
      os="mac"
      PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
    fi
    ;;
  # windows
  msys)
    os="windows"
    PATH="C:\\msys64\\usr\\bin\\:$PATH"
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

function grepr() {
  if [-z $1] || [-z $2] || [-z $3] ; then
    echo "第1引数:検索パス、第2引数:検索文字列 [第3引数:置換文字列を入力してください。]"
    return 1
  fi

  grep -lr "$2" $1 | sort | uniq | xargs perl -e "s/$2/$3/" -pi
}

function git_diff_archive() {
  local diff=""
  local h="HEAD"
  if [$# -eq 1]; then
    if expr "$1" : '[0-9]*$' > /dev/null ; then
      diff="HEAD~${1} HEAD"
    else
      diff="${1} HEAD"
    fi
  elif [$# -eq 2]; then
    diff="${2} ${1}"
    h=$1
  fi
  if ["$diff" != ""]; then
    diff="git diff --diff-filter=d --name-only ${diff}"
  fi

  git archive --format=zip --prefix=root/ $h `eval $diff` -o archive.zip
}
