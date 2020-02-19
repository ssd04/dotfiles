# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bira"

plugins=(git laravel4 composer symfony2 zsh-autosuggestions docker-compose)

source $ZSH/oh-my-zsh.sh
source ~/.bash_aliases

# Enable aws cli completion
source $HOME/.local/bin/aws_zsh_completer.sh

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

# enable vi mode in shell
bindkey -v
export KEYTIMEOUT=1

bindkey '^R' history-incremental-search-backward

[[ $TERM != "screen-256color" ]] && exec tmux -2
