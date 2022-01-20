# test os[windows & mac]
# @require
# charcode        : utf-8
# linefeedcode    : lf
# indent          : tab
MAKEFLAGS    += --no-print-directory
.DEFAULT_GOAL:= help

.PHONY: all install
all: install

install: ## Software Install. Windows: Chocolatey, Other(Mac): Homebrew.
	@echo [33mInstall start. [0m;
ifeq ($(OS),Windows_NT)
	-@cinst chocolateygui
	-@cinst cmder nodist git winscp putty vagrant virtualbox docker docker-compose docker-machine
	-@cinst ack
	-@cinst ripgrep
	-@cinst googlechrome firefox
	-@cinst tortoisesvn git-fork
	-@cinst adobereader irfanview
	-@cinst winrar lhaplus
	-@cinst python2 python3 ruby
	-@cinst keypirinha googlejapaneseinput
	-@cinst vim hidemaru-editor
	-@cinst winmerge

	-@choco list -localonly
	-@echo "install etc: idmanager, adobe, subsetfont, woffconv"
else
	-@xcode-select --install
	-@sudo xcode-select --switch /Library/Developer/CommandLineTools
	-@ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	-@brew doctor
	-@brew install wget
	-@brew install git
	-@brew install pyenv
	-@brew install neovim
	-@git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

	-@pyenv versions

	-@pyenv install 2.7.18
	-@pyenv virtualenv 2.7.18 neovim2
	-@pyenv activate neovim2
	-@pip install neovim

	-@pyenv install 3.9.1
	-@pyenv virtualenv 3.9.1 neovim3
	-@pyenv activate neovim3
	-@pip3 install neovim

	-@pyenv global 3.9.1 2.7.18
	-@python -V
	-@python2 -V
	-@python3 -V

	# -@brew install nodebrew
	# -@mkdir -p ~/.nodebrew/src
	# -@nodebrew install-binary stable
	# -@nodebrew use stable
	-@brew install nodenv
	-@git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
	-@git clone https://github.com/nodenv/node-build-update-defs.git ~/.nodenv/plugins/node-build-update-defs
	-@nodenv install 16.13.2
	-@nodenv global 16.13.2
	-@node -v
	-@npm i --save -g gulp-cli

	# https://github.com/mileszs/ack.vim/issues/156
	# sudo apt-get install ack
	-@brew install ack
	-@brew install the_silver_searcher
	-@brew install fzf
	-@brew install ripgrep
	-@brew install tree

	-@brew install tnftp
	-@brew install mysql
	-@brew install macvim
	# https://atom.io/packages/veda/
	-@brew install --cask atom
	-@brew install --cask iterm2
	-@brew install --cask vagrant
	-@brew install --cask virtualbox
	-@brew install --cask docker
	-@brew install docker-compose
	-@brew install docker-machine-nfs
	-@brew install --cask google-chrome
	-@brew install --cask firefox
	-@brew install --cask fork
	-@brew install --cask alfred
	# http://atarimae.hatenablog.com/entry/2014/05/21/173856
	-@brew install --cask google-japanese-ime
	-@brew install --cask clipy
	-@brew install --cask comparemerge
	-@brew install --cask slack
	-@brew install --cask appcleaner
	-@brew install --cask blender
	-@brew install --cask android-studio
	-@brew install --cask versions
	-@brew install --cask adobe-creative-cloud

	-@brew install zsh
	-@sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
	-@chsh -s '/usr/local/bin/zsh'
	-@sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	-@compaudit | xargs chmod g-w,o-w

	-@brew doctor
	-@brew list
	-@brew cask list
	-@echo "install etc: subsetfont, woffconv"
	
	-@defaults write com.apple.finder AppleShowAllFiles TRUE
	-@killall Finder
endif
	@echo [32mInstall complete!. ✔︎[0m;

help: ## this message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
