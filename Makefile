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
DOT_PATH     := $(shell /usr/bin/cygpath -w "$(abspath .)$(DS)")
HOME_DIR     := $(shell /usr/bin/cygpath -w "$(HOME)$(DS)")
DS           := $(shell echo "\\")
ML_FILE_CMD  := cmd.exe //C mklink
ML_DIR_CMD   := cmd.exe //C mklink //d
RM_FILE_CMD  := cmd.exe //C del
RM_DIR_CMD   := cmd.exe //C rmdir
# for others(mac)
else
DOT_PATH     := $(PWD)$(DS)
HOME_DIR     := $(HOME)$(DS)
ML_FILE_CMD  := ln -sfnv
ML_DIR_CMD   := $(ML_FILE_CMD)
RM_FILE_CMD  := rm -f
RM_DIR_CMD   := rm -r
endif

.PHONY: all install deploy clean list help
all: clean deploy
install: init
init: clean deploy ## clean to deploy.

deploy: ## Create symlink from dotfiles.
	@make _message_start TASK_NAME:="Deploy"
ifeq ($(OS),Windows_NT)
	-@$(foreach f, $(DOT_DIRS), $(ML_DIR_CMD) "$(HOME_DIR)$(f)" "$(DOT_PATH)$(f)";)
	-@$(foreach f, $(DOT_FILES), $(ML_FILE_CMD) "$(HOME_DIR)$(f)" "$(DOT_PATH)$(f)";)
else
	# mkdir $(HOME_DIR).temp/
	-@mkdir $(HOME_DIR).temp/
	-@$(foreach f, $(DOT_DIRS), $(ML_DIR_CMD) $(DOT_PATH)$(f) $(HOME_DIR)$(f);)
	-@$(foreach f, $(DOT_FILES), $(ML_FILE_CMD) $(DOT_PATH)$(f) $(HOME_DIR)$(f);)
endif
	@make _message_end TASK_NAME:="Deploy"

clean: ## Remove symlink to dotfiles.
	-@make _commons \
		TASK_NAME:="Clean" \
		CMD_DIR:="$(RM_DIR_CMD)" \
		CMD_FILE:="$(RM_FILE_CMD)"
ifeq ($(OS),Windows_NT)
else
	# $(RM_DIR_CMD) $(HOME_DIR).temp/
	-@$(RM_DIR_CMD) $(HOME_DIR).temp/
endif

list: ## dotfiles list.
	-@make _commons \
		TASK_NAME:="List" \
		CMD_DIR:=echo \
		CMD_FILE:=echo

_commons:
	@make _message_start TASK_NAME:=$(TASK_NAME)
ifeq ($(OS),Windows_NT)
	-@$(foreach f, $(DOT_DIRS), $(CMD_DIR) "$(HOME_DIR)$(f)";)
	-@$(foreach f, $(DOT_FILES), $(CMD_FILE) "$(HOME_DIR)$(f)";)
else
	-@$(foreach f, $(DOT_DIRS), $(CMD_DIR) $(HOME_DIR)$(f);)
	-@$(foreach f, $(DOT_FILES), $(CMD_FILE) $(HOME_DIR)$(f);)
endif
	@make _message_end TASK_NAME:=$(TASK_NAME)

_message_start:
	@echo [33m$(TASK_NAME) dotfiles start. [0m;

_message_end:
	@echo [32m$(TASK_NAME) dotfiles complete!. ✔︎[0m;

help: ## this message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

