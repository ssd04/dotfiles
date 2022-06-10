# Personal shortcuts
alias cls='clear'
alias g='google-chrome'
alias pdf='xdg-open'
alias ll='ls -la'
alias l='ls -l'
alias ls='ls --color=auto'
alias grepr='grep -Hrn'
alias grepi='grep -Hrni'

# Arch Linux related shortcuts
alias pcmi='sudo pacman -S'
alias pcms='sudo pacman -Ss'
alias pcmu='sudo pacman -Sy'

# Ubuntu related shortcuts
alias aptu='sudo apt-get update'
alias apts='sudo apt-cache search'
alias apti='sudo apt-get install'

# LXC related shortcuts
alias lxc-ls='sudo lxc-ls --fancy'

# Git shortcuts
alias gits='git status'
alias gitl='git log'
alias gitc='git commit -m'
alias gitk='git checkout'
alias gitd='git diff'
alias gitb='git branch'

# Security updates
alias sec='sudo apt-get update && { sudo apt-get -s dist-upgrade | grep "^Inst" | grep -i securi | cut -d " " -f 2 | xargs sudo apt-get install -y }'

# i3
alias lock='i3lock -c 333333'

# golang
alias gotest='go test ./...'
