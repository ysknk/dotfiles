#!/bin/sh
DOTFILES_DIR="${HOME}/dotfiles"
NVIM_DIR="${XDG_CONFIG_HOME}/nvim"

cd ${DOTFILES_DIR}

#
# Deploy files and dirs
#

# Deploy nvim dir
if [ ! -e $NVIM_DIR ]; then
  mkdir $NVIM_DIR
fi

# Deploy files and dirs
for f in .??*
do
  if [ ${f} == ".gvimrc" ] ; then
    ln -snfv ${DOTFILES_DIR}/${f} ${NVIM_DIR}/ginit.vim
  elif [ ${f} == ".vimrc" ] ; then
    ln -snfv ${DOTFILES_DIR}/${f} ${NVIM_DIR}/init.vim
  fi
  [[ ${f} == ".git" ]] && continue
  [[ ${f} == ".gitignore" ]] && continue
  [[ ${f} == ".gitmodules" ]] && continue
  [[ ${f} == ".DS_Store" ]] && continue
  [[ ${f} == ".travis.yml" ]] && continue
  ln -snfv ${DOTFILES_DIR}/${f} ${HOME}/${f}
done

echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
#
# End Deploy
#

