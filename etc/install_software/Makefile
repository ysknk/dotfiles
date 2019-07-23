# test os[windows & mac]
# @require
# charcode        : utf-8
# linefeedcode    : lf
# indent          : tab
MAKEFLAGS    += --no-print-directory
.DEFAULT_GOAL:= help

.PHONY: all install
all: install

install: ## Software Install. Windows: Chocolatey, Other(Mac): Homebre.
	@echo [33mInstall start. [0m;
ifeq ($(OS),Windows_NT)
	-@cinst chocolateygui
	-@cinst cmder nodist git winscp putty vagrant virtualbox docker
	-@cinst googlechrome firefox
	-@cinst tortoisesvn sourcetree
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
	-@brew install caskroom/cask/brew-cask
	-@brew install wget
	-@brew install pyenv
	-@brew install nodebrew
	-@brew install git
	-@brew install docker
	-@brew cask install iterm2
	-@brew cask install vagrant
	-@brew cask install virtualbox
	-@brew cask install docker
	-@brew cask install google-chrome
	-@brew cask install firefox
	-@brew cask install sourcetree
	-@brew cask install alfred
	-@brew cask install google-japanese-ime
	-@brew cask install clipy
	-@brew cask install comparemerge

	-@brew doctor
	-@brew list
	-@brew cask list
	-@echo install memo -> adobe
endif
	@echo [32mInstall complete!. ✔︎[0m;

help: ## this message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
