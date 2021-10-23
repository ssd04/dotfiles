# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bira"

plugins=(git laravel4 composer symfony2 zsh-autosuggestions docker-compose)

source $ZSH/oh-my-zsh.sh
source ~/.bash_aliases

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^t' autosuggest-execute
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

# enable vi mode
bindkey -v

# Enable click by one touchpad touch
synclient TapButton1=1

HISTSIZE=90000
export GOPATH="$HOME/dev/go"
export GOBIN=$GOPATH/bin

# Latex setup
export MANPATH="$MANPATH:/usr/local/texlive/2020/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/usr/local/texlive/2020/texmf-dist/doc/info"
export PATH=$PATH:$HOME/.local/bin:/usr/local/go/bin:/usr/local/texlive/2020/bin/x86_64-linux

[[ $TERM != "screen-256color" ]] && exec tmux -2
