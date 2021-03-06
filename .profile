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

  # export PATH="$PATH:$HOME/local/elixir/bin"
  export PATH="$PATH:$HOME/.rvm/bin"
  export PATH="$PATH:$HOME/local/premake-core/bin/release"
  export PATH="$PATH:/opt/git/potion/bin"
  export PATH="$PATH:/opt/http/tmux-1.9a/"
  export PATH="$PATH:/usr/lib/go-1.9/bin"
  export PATH="$HOME/.cargo/bin:$PATH"
  export PATH="/usr/local/heroku/bin:$PATH"
  export PATH="$PATH:$(go env GOPATH)/bin"
  # rely on `site` module to get platform-specific user install directory
  export PATH="$PATH:$(python -m site --user-base)/bin"
  export PATH="$PATH:/usr/local/lib/python2.7"

# elif [[ "$OSTYPE" == "darwin"* ]]; then
#   # Allegro 5
#   export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
#   export C_INCLUDE_PATH=/usr/local/include
fi

# for pipenv
export PATH="$HOME/.local/bin:$PATH"

# EB CLI
export PATH="$HOME/.ebcli-virtual-env/executables:$PATH"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Helm v2
export PATH="/usr/local/opt/helm@2/bin:$PATH"
