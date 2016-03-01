# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# Set PATH so it includes user's private bin if it exists.
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# Add RVM to PATH for scripting.
export PATH="$PATH:$HOME/.rvm/bin"

# Elixir
export PATH="$PATH:$HOME/Local/elixir/1.1.1/bin"

# Docker
export DOCKER_HOST="tcp://localhost:4243"

# Potion
export PATH="$PATH:/opt/git/potion/bin"

# tmux
export PATH="$PATH:/opt/http/tmux-1.9a/"

# Elm
export ELM_HOME="$HOME/.nvm/v0.10.26/lib/node_modules/elm/share"

# nvm
[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh

# Load RVM into a shell session *as a function*.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Allegro 5
# export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
# export C_INCLUDE_PATH=/usr/local/include
