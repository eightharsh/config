# Environment
export PATH=/opt/homebrew/bin:$PATH
export LANG=en_US.UTF-8
export EDITOR=/opt/homebrew/bin/vim

# Aliases
alias cd='z'
alias cat=bat
alias la='tree'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias h='history'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --all'
alias rm='rm -i'           # safer delete
alias brewup='brew update && brew upgrade && brew cleanup'
alias zd='z'               # zoxide shortcut

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# Zsh Options
setopt AUTO_CD            # cd without typing 'cd'
setopt EXTENDED_GLOB      # advanced globbing
setopt CORRECT            # autocorrect typos


# zsh-autosuggestions (load immediately so it works)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zoxide (optional lazy-load)
eval "$(zoxide init zsh)"



#Starship
eval "$(starship init zsh)"

# bun completions
[ -s "/Users/eightharsh/.bun/_bun" ] && source "/Users/eightharsh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"


#bindkey -v

# Use Homebrew GCC as default
alias gcc="gcc-15"
alias g++="g++-15"
alias cpp="cpp-15"

export PATH="/opt/homebrew/bin:$PATH"


export PATH=$PATH:/Users/eightharsh/.spicetify
