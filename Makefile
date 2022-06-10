SHELL := $(shell which bash)

.DEFAULT_GOAL := help

.PHONY: help sync-all sync-config sync-nvim sync-i3 sync-local

help:
	@echo -e ""
	@echo -e "Make commands:"
	@grep -E '^[a-zA-Z_-]+:.*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":"}; {printf "\t\033[36m%-30s\033[0m\n", $$1}'
	@echo -e ""

sync-all:
	rsync \
        --recursive \
        --exclude ".git/" \
        --exclude ".gitignore" \
		--exclude "tmux_plugins/" \
		--exclude "setup_tools.sh" \
		--exclude "bash_functions.sh" \
		--exclude "Makefile" \
		--exclude "README.md" \
		-avh --no-perms . ~;

sync-config:
	rsync \
        --recursive \
		-avh --no-perms \
		.config ~;

sync-nvim:
	rsync \
		-avh --no-perms \
		.config/nvim ~/.config;

sync-i3:
	rsync \
		-avh --no-perms \
		.config/i3 ~/.config;
	~/.local/bin/i3-config-update

sync-local:
	rsync \
		-avh --no-perms \
		.local ~;
