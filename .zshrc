# Export locale settings
export LANG="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"
export EDITOR=nvim

# 28/09/2025: ^A & ^E don't work inside tmux, this is suggested by LLM
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^R' history-incremental-search-backward
# 18/01/2026: word navigation does not work inside tmux
bindkey '^[[1;3D' backward-word   # Option+Left
bindkey '^[[1;3C' forward-word    # Option+Right

# Set COLORTERM, this will help remove the error, as mentioned [here](https://github.com/neovim/neovim/issues/28776)
export COLORTERM=256
# Add java path
# - Older java version, don't even know why this is installed
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-24.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export HDF5_DIR="$(brew --prefix hdf5)"
export DYLD_LIBRARY_PATH=$(brew --prefix)/lib:$DYLD_LIBRARY_PATH

# Change color  options for ls and grep
# LSCOLORS assigns the colors for different file types, eg directory,
# file, symlink, executable etc
export LSCOLORS=GxFxCxDxBDegedabagaced
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -a'
alias l='ls'
export CLICOLOR=1
alias grep='grep --color=auto'

autoload -Uz vcs_info
#autoload -U promptinit && promptinit
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'

# Change the prompt
setopt PROMPT_SUBST
PROMPT='%F{green}${PWD/#$HOME/~}%f '
PROMPT+='%F{cyan}${vcs_info_msg_0_}%f
%F{green}>%f '

# Add ruby path to PATH, needed by jekyll
#export PATH=$(brew --prefix)/opt/ruby/bin:$PATH
#export PATH=$(brew --prefix)/lib/ruby/gems/3.3.0/bin:$PATH
#export PATH=$HOME/.gem/ruby/3.3.0/bin:$PATH

# Headers for Ruby
#export SDKROOT=$(xcrun --show-sdk-path)
# Needed by GPG
export GPG_TTY=$(tty)

# homebrew bin directory
export PATH=/opt/homebrew/bin:$PATH

alias python=python3
# Added bin path for packages installed by npm
export PATH=$HOME/.npm-global/bin:$PATH

export PATH=$PATH:$HOME/Library/Caches/.wasm-pack/.wasm-bindgen-cargo-install-0.2.95/bin

export PATH=$PATH:$HOME/go/bin
# export PATH=$HOME/.local/share/bob/nvim-bin:$PATH
