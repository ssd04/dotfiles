# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bira"

plugins=(git laravel4 composer symfony2 zshmarks zsh-autosuggestions docker-compose)

source $ZSH/oh-my-zsh.sh
source ~/.bash_aliases

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^t' autosuggest-execute
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

# Enable click by one touchpad touch
synclient TapButton1=1

HISTSIZE=90000

[[ $TERM != "screen-256color" ]] && exec tmux -2
