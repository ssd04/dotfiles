# Dotfiles

This is a collection of dot files I use for my Arch and Ubuntu systems.

The current setup is using: `neovim`, `tmux`, `i3`, and others..
Each config file on the system is a link to the coresponding file in the repo directory.

## Setup

The config files can be synced using `rsync` tool.
There are several make command for this:

```bash
# Sync all files including directories
make sync-all
```

```bash
# Sync only .config dir
make sync-config
```

```bash
# Sync NeoVim configuration
make sync-nvim
```
