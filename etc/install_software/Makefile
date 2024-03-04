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
	-@cinst cmder git winscp putty vagrant virtualbox docker docker-compose docker-machine

	# refs: https://zenn.dev/longbridge/articles/30c70144c97d32
	-@cinst volta
	-@volta install node

	-@cinst ack
	-@cinst ripgrep
	-@cinst fd
	-@cinst deno
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
	-@exec $SHELL -l
	-@/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	-@exec $SHELL -l

	-@brew doctor
	-@brew install wget
	-@brew install git
	-@exec $SHELL -l

	-@brew install anyenv
	-@anyenv init
	-@exec $SHELL -l
	-@anyenv install --init
	-@anyenv install pyenv
	-@exec $SHELL -l

	-@curl https://get.volta.sh | bash
	-@exec $SHELL -l
	-@volta install node

	-@node -v
	-@npm i --save -g gulp-cli

	-@brew install neovim
	-@git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

	-@pyenv versions

	-@pyenv install 2.7.18
	-@pyenv virtualenv 2.7.18 neovim2
	-@pyenv activate neovim2
	-@pip2 install pynvim

	-@pyenv install 3.9.1
	-@pyenv virtualenv 3.9.1 neovim3
	-@pyenv activate neovim3
	-@pip3 install pynvim

	-@pyenv global 3.9.1 2.7.18
	-@python -V
	-@python2 -V
	-@python3 -V

	# https://github.com/mileszs/ack.vim/issues/156
	-@brew install ack
	-@brew install the_silver_searcher
	-@brew install fzf
	-@brew install ripgrep
	-@brew install fd
	-@brew install tree
	-@brew install deno

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
	-@brew install --cask p4v
	-@brew install --cask slack
	-@brew install --cask appcleaner
	-@brew install --cask blender
	-@brew install --cask android-studio
	-@brew install --cask versions
	-@brew install --cask adobe-creative-cloud
	-@brew install --cask deepl
	-@brew install zsh
	-@sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
	-@chsh -s '/usr/local/bin/zsh'
	-@sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	-@compaudit | xargs chmod g-w,o-w

	-@brew doctor
	-@brew list
	-@echo "install etc: subsetfont, woffconv"	
endif
	@echo [32mInstall complete!. ✔︎[0m;

help: ## this message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
