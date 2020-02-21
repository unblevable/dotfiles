alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

alias ag='ag --color-path="0;34"'

if [[ "$OSTYPE" =~ ^linux ]]; then
  alias ls='ls --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls='ls -G'
fi
