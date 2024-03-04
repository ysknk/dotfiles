# test os[windows & mac]
# @require
# charcode        : utf-8
# linefeedcode    : lf
# indent          : tab
MAKEFLAGS    += --no-print-directory
.DEFAULT_GOAL:= help

DOT_EXCLUDES := .DS_Store Thumbs.db .git .gitmodules .gitignore .travis.yml
DOT_TARGET   := $(wildcard .??*)
DOT_FILES    := $(filter-out $(DOT_EXCLUDES), $(DOT_TARGET))

DOT_DIRS     := $(wildcard _??*)

DS           := $(shell echo "/")

# for windows
ifeq ($(OS),Windows_NT)
DOT_PATH     := $(shell /usr/bin/cygpath -w "$(HOME)$(DS)dotfiles/")
HOME_DIR     := $(shell /usr/bin/cygpath -w "$(HOME)$(DS)")
DS           := $(shell echo "\\")
ML_FILE_CMD  := cmd.exe //C mklink
ML_DIR_CMD   := cmd.exe //C mklink //d
RM_FILE_CMD  := cmd.exe //C del
RM_DIR_CMD   := cmd.exe //C rmdir

NVIM_DIR     := $(shell /usr/bin/cygpath -w "$(LOCALAPPDATA)$(DS)nvim")
INITVIM      := $(shell /usr/bin/cygpath -w "$(NVIM_DIR)$(DS)init.vim")
GINITVIM     := $(shell /usr/bin/cygpath -w "$(NVIM_DIR)$(DS)ginit.vim")
# for others(mac)
else
DOT_PATH     := $(HOME)$(DS)dotfiles/
HOME_DIR     := $(HOME)$(DS)
ML_FILE_CMD  := ln -sfnv
ML_DIR_CMD   := $(ML_FILE_CMD)
RM_FILE_CMD  := rm -f
RM_DIR_CMD   := rm -r

NVIM_DIR     := $(XDG_CONFIG_HOME)$(DS)nvim
INITVIM      := $(NVIM_DIR)$(DS)init.vim
GINITVIM     := $(NVIM_DIR)$(DS)ginit.vim
endif

VIMRC        := $(DOT_PATH).vimrc
GVIMRC       := $(DOT_PATH).gvimrc

.PHONY: all install deploy clean list help
all: clean deploy
install: init
init: clean deploy ## clean to deploy.

deploy: ## Deploy nvim files.
	@echo [33mDeploy nvim dotfiles start. [0m;
	-@mkdir -p "$(NVIM_DIR)"
ifeq ($(OS),Windows_NT)
	-@$(ML_FILE_CMD) $(INITVIM) $(VIMRC)
	-@$(ML_FILE_CMD) $(GINITVIM) $(GVIMRC)
else
	-@$(ML_FILE_CMD) $(VIMRC) $(INITVIM)
	-@$(ML_FILE_CMD) $(GVIMRC) $(GINITVIM)
endif
	@echo [32mDeploy nvim dotfiles complete!. ✔︎[0m;

clean: ## Remove nvim files.
	@echo [33mClean nvim dotfiles start. [0m;
	-@$(RM_FILE_CMD) $(INITVIM)
	-@$(RM_FILE_CMD) $(GINITVIM)
	-@$(RM_DIR_CMD) $(NVIM_DIR)
	@echo [32mClean nvim dotfiles complete!. ✔︎[0m;

list: ## nvim list.
	@echo [33mList nvim dotfiles start. [0m;
	@echo [33mDeploy or Clean Files list. [0m;
	-@echo $(NVIM_DIR)
	-@echo $(INITVIM)
	-@echo $(GINITVIM)
	@echo [32mList nvim dotfiles complete!. ✔︎[0m;

help: ## this message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
