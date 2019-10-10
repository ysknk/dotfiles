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
	-@cinst googlechrome firefox
	-@cinst tortoisesvn git-fork
	-@cinst adobereader irfanview
	-@cinst winrar lhaplus
	-@cinst python2 python3 ruby
	-@cinst keypirinha googlejapaneseinput
	-@cinst vim hidemaru-editor
	-@cinst winmerge

	-@choco list -localonly
	-@echo install memo -> idmanager, asr, adobe
else
	-@xcode-select --install
	-@sudo xcode-select --switch /Library/Developer/CommandLineTools
	-@/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	-@brew doctor
	-@brew cask
	-@brew install caskroom/cask/brew-cask
	-@brew install wget
	-@brew install git
	-@brew install pyenv
	-@git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

	-@brew install nodebrew
	-@mkdir -p ~/.nodebrew/src
	-@nodebrew install-binary stable
	-@nodebrew use stable
	-@npm i --save -g gulp-cli

	-@brew install zsh
	-@sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
	-@chsh -s '/usr/local/bin/zsh'
	-@sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	# https://github.com/mileszs/ack.vim/issues/156
	# sudo apt-get install ack
	-@brew install ack
	brew install the_silver_searcher

	-@brew install docker
	-@brew cask install iterm2
	-@brew cask install vagrant
	-@brew cask install virtualbox
	-@brew cask install docker
	-@brew cask install docker-compose
	-@brew cask install docker-machine
	-@brew cask install google-chrome
	-@brew cask install firefox
	-@brew cask install fork
	-@brew cask install alfred
	-@brew cask install google-japanese-ime
	-@brew cask install clipy
	-@brew cask install comparemerge

	-@brew doctor
	-@brew list
	-@brew cask list
	-@echo install memo -> adobe
	
	-@defaults write com.apple.finder AppleShowAllFiles TRUE
	-@killall Finder
endif
	@echo [32mInstall complete!. ✔︎[0m;

help: ## this message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
