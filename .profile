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

# platform specific...
if [[ "$OSTYPE" =~ ^linux ]]; then
  export DOCKER_HOST="tcp://localhost:4243"
  export ELM_HOME="$HOME/.nvm/v0.10.26/lib/node_modules/elm/share"
  export GOPATH="$HOME/.go"
  export NVM_DIR="/home/unblevable/.nvm"

  # export PATH="$PATH:$HOME/local/elixir/bin"
  export PATH="$PATH:$HOME/.rvm/bin"
  export PATH="$PATH:$HOME/local/premake-core/bin/release"
  export PATH="$PATH:/opt/git/potion/bin"
  export PATH="$PATH:/opt/http/tmux-1.9a/"
  export PATH="$PATH:/usr/lib/go-1.9/bin"
  export PATH="$HOME/.cargo/bin:$PATH"
  export PATH="/usr/local/heroku/bin:$PATH"
  export PATH="$PATH:$(go env GOPATH)/bin"


  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Allegro 5
  # export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
  # export C_INCLUDE_PATH=/usr/local/include
fi
