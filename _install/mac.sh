#!/bin/sh
DOTFILES_DIR="${HOME}/dotfiles"

cd ${DOTFILES_DIR}

for f in .??*
do
  [[ ${f} = ".git" ]] && continue
  [[ ${f} = ".gitignore" ]] && continue
  ln -snfv ${DOTFILES_DIR}/${f} ${HOME}/${f}
done

echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)

