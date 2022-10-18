# Add java path
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
#export PATH=/opt/homebrew/bin:$PATH
#export TEXINPUTS=.:$HOME/Library/share/latex//
export HDF5_DIR="$(brew --prefix hdf5)"
export DYLD_LIBRARY_PATH=$(brew --prefix)/lib:$DYLD_LIBRARY_PATH
export PATH=$HOME/Library/Python/3.8/bin:$PATH

# Change color  options for ls and grep
# LSCOLORS assigns the colors for different file types, eg directory,
# file, symlink, executable etc
export LSCOLORS=GxFxCxDxBDegedabagaced
alias ls='ls -F'
alias ll='ls -l'
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
#export PS1='%F{green}%15<...<%~%f%<< ${vcs_info_msg_0_} >> '
#export PS1='%F{green}%2~%f %# '

# Add ruby path to PATH, needed by jekyll
export PATH=$(brew --prefix)/opt/ruby/bin:$PATH
export PATH=$(brew --prefix)/lib/ruby/gems/3.1.0/bin:$PATH
# export PATH=$HOME/.gem/ruby/3.0.0/bin:$PATH

# Headers for Ruby
export SDKROOT=$(xcrun --show-sdk-path)
# Needed by GPG
export GPG_TTY=$(tty)

# homebrew bin directory
export PATH=/opt/homebrew/bin:$PATH
# GOPATH
export PATH=/usr/local/go:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

alias python=python3
