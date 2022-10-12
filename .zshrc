source ~/repos/znap/zsh-snap/znap.zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER="lowestalnacke"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
  iterm2
  zoxide
  thefuck
  # pyenv
  fzf
  ripgrep
  nvm
)

# export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR="$HOME/.nvm"

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=true
ZSH_TMUX_AUTOCONNECT=false

znap source marlonrichert/zsh-autocomplete

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"
# eval "$(pyenv init -)" 
# pyenv global 3.10.1

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# source $HOME/.fzf.zsh
# export FZF_DEFAULT_COMMAND="rg --hidden --files -g '!.git/**/*'" 

export GOPATH=$HOME/go-workspace # don't forget to change your path correctly!
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GO111MODULE=auto

alias root='cd "$(git rev-parse --show-toplevel)"'

alias v="nvim"
alias gs="git status"
alias re="cd ~/repos"
alias ..="cd .."
alias vrc="nvim ~/.vimrc"
alias nrc="nvim ~/.config/nvim/init.lua"
alias zrc="nvim ~/.zshrc"
alias trc="nvim ~/.tmux.conf"
alias dotfiles="/usr/bin/git --git-dir=$HOME/repos/dotfiles/.git/ --work-tree=$HOME"

alias cat='bat --paging=never'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export GIT_PAGER='delta'

export BAT_THEME='OneHalfDark'
export XDG_CONFIG_HOME="$HOME/.config"
export LUA_PATH="$HOME/lua;$HOME/lua-5.3.5;$HOME/.luarocks/share/lua/5.3/?.lua;$HOME/.luarocks/share/lua/5.3/?/init.lua;/usr/local/share/lua/5.3/?.lua;/usr/local/share/lua/5.3/?/init.lua;?.lua"
export LUA_CPATH="/usr/local/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/loadall.so;./?.so;$HOME/.luarocks/lib/lua/5.3/?.so"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="$PATH:$HOME/neovim/bin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin:$HOME/bin"
export PATH="$PATH:$HOME/.luarocks/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.nvm/versions/node/v12.9.0/bin:$HOME/.nvm/versions/node/v12.16.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/.fzf/bin:$HOME/go-workspace/bin:/usr/local/opt/go/libexec/bin:/usr/local/git/bin"

export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"
