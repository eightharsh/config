# ====================================================================
# PREMIUM ZSHRC - Vim Minimal Dark Integration
# Optimized for Ghostty terminal with Iosevka Term font
# Professional, distraction-free, performance-focused
# ====================================================================

# Performance optimization - load modules only when needed
zmodload zsh/complist
zmodload zsh/datetime
zmodload zsh/mathfunc
zmodload -F zsh/stat b:zstat

# ====================================================================
# ZSH CORE CONFIGURATION - Enhanced settings
# ====================================================================

# Advanced history management
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY          # Record timestamp and duration
setopt HIST_EXPIRE_DUPS_FIRST    # Delete duplicates first when trimming
setopt HIST_IGNORE_DUPS          # Don't record duplicates
setopt HIST_IGNORE_ALL_DUPS      # Delete old duplicates when new added
setopt HIST_FIND_NO_DUPS         # Don't display duplicates in search
setopt HIST_IGNORE_SPACE         # Don't record commands that start with space
setopt HIST_SAVE_NO_DUPS         # Don't write duplicates to file
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks
setopt HIST_VERIFY               # Show command before executing from history
setopt SHARE_HISTORY             # Share history between sessions
setopt INC_APPEND_HISTORY        # Append immediately, don't wait for exit

# Enhanced navigation and completion
setopt AUTO_CD                   # cd by just typing directory name
setopt AUTO_PUSHD                # cd pushes to directory stack
setopt PUSHD_IGNORE_DUPS         # Don't push duplicates
setopt PUSHD_SILENT              # Don't print directory stack
setopt PUSHD_MINUS               # Make cd -n equivalent to cd +n
setopt CORRECT                   # Spelling correction for commands
setopt CORRECT_ALL               # Spelling correction for arguments
setopt COMPLETE_IN_WORD          # Complete from both ends of word
setopt ALWAYS_TO_END             # Move cursor to end after completion
setopt AUTO_MENU                 # Show completion menu on tab
setopt AUTO_LIST                 # List choices on ambiguous completion
setopt LIST_PACKED               # Compact completion lists
setopt MENU_COMPLETE             # Insert first match immediately

# Advanced shell behavior
setopt EXTENDED_GLOB             # Extended globbing patterns
setopt GLOB_DOTS                 # Include dotfiles in glob
setopt NUMERIC_GLOB_SORT         # Sort numerically when possible
setopt PROMPT_SUBST              # Allow variable substitution in prompt
setopt INTERACTIVE_COMMENTS      # Allow comments in interactive shell
setopt LONG_LIST_JOBS            # Show PID in job control
setopt AUTO_RESUME               # Resume jobs with simple name
setopt NOTIFY                    # Report job status immediately
setopt NO_BEEP                   # Disable beeping
setopt NO_FLOW_CONTROL           # Disable Ctrl-S/Ctrl-Q
setopt NO_CLOBBER                # Prevent overwriting files with >
setopt MULTIOS                   # Allow multiple redirections
setopt PATH_DIRS                 # Search for subdirectories in $path

# ====================================================================
# ADVANCED COMPLETION SYSTEM - Vim color integration
# ====================================================================

# Intelligent completion loading
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
  break
done
[[ -z "$dump" ]] && compinit -C

# Enhanced completion behavior
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true

# Vim-inspired completion colors - perfectly matched to theme
zstyle ':completion:*:default' list-colors \
    'di=38;5;180:ln=38;5;117:so=38;5;146:pi=38;5;180:ex=38;5;150:bd=38;5;180:cd=38;5;180:su=38;5;174:sg=38;5;174:tw=38;5;180:ow=38;5;180' \
    '*.tar=38;5;174:*.tgz=38;5;174:*.zip=38;5;174:*.gz=38;5;174:*.bz2=38;5;174:*.xz=38;5;174:*.7z=38;5;174' \
    '*.py=38;5;186:*.js=38;5;186:*.ts=38;5;186:*.html=38;5;146:*.css=38;5;117:*.scss=38;5;117:*.json=38;5;186:*.xml=38;5;146:*.yml=38;5;117:*.yaml=38;5;117' \
    '*.md=38;5;253:*.txt=38;5;253:*.log=38;5;245:*.conf=38;5;180:*.cfg=38;5;180'

# Advanced completion styling
zstyle ':completion:*:descriptions' format '%F{180}-- %d --%f'
zstyle ':completion:*:messages' format '%F{174}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{174}-- No matches found --%f'
zstyle ':completion:*:corrections' format '%F{215}-- %d (errors: %e) --%f'

# Process completion with colors
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;38;5;180=0=01;38;5;174'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always

# ====================================================================
# SOPHISTICATED PROMPT - Vim Minimal Dark inspired
# ====================================================================

# Git status with enhanced information
git_info() {
    local branch ref dirty ahead behind
    
    # Get current branch or short SHA
    ref=$(git symbolic-ref --quiet HEAD 2>/dev/null) || \
    ref=$(git rev-parse --short HEAD 2>/dev/null) || return 0
    branch=${ref#refs/heads/}
    
    # Check if dirty
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
        dirty="*"
    fi
    
    # Check ahead/behind
    local commits
    commits=$(git rev-list --count --left-right '@{upstream}...HEAD' 2>/dev/null)
    case "$commits" in
        "") ;;
        "0	0") ;;
        "0	"*) ahead=" ↑${commits#0	}" ;;
        *"	0") behind=" ↓${commits%	0}" ;;
        *) ahead=" ↑${commits#*	}"; behind=" ↓${commits%	*}" ;;
    esac
    
    if [[ -n $dirty ]]; then
        echo " %F{174}${branch}${dirty}%f%F{215}${ahead}${behind}%f"
    else
        echo " %F{150}${branch}%f%F{215}${ahead}${behind}%f"
    fi
}

# Enhanced virtual environment info
venv_info() {
    local env_name=""
    
    # Python virtual environments
    if [[ -n $VIRTUAL_ENV ]]; then
        env_name="$(basename "$VIRTUAL_ENV")"
    # Conda environments
    elif [[ -n $CONDA_DEFAULT_ENV ]] && [[ "$CONDA_DEFAULT_ENV" != "base" ]]; then
        env_name="$CONDA_DEFAULT_ENV"
    # Node.js version (if nvm is used)
#    elif command -v node >/dev/null 2>&1; then
#       local node_version
 #       node_version=$(node --version 2>/dev/null | sed 's/v//')
  #      if [[ -n $node_version ]] && [[ "$node_version" != "system" ]]; then
   #         env_name="node:$node_version"
    #    fi
    fi
    
    if [[ -n $env_name ]]; then
        echo " %F{117}($env_name)%f"
    fi
}

# SSH connection indicator
ssh_info() {
    if [[ -n $SSH_CONNECTION ]]; then
        echo "%F{139}@%m%f "
    fi
}

# Exit status indicator (only shown on non-zero exit)
exit_status_info() {
    echo "%(?..'%F{174}[%?]%f ')"
}

# Sophisticated two-line prompt
PROMPT='%K{235}%F{245}%~%f$(git_info)$(venv_info)%k '


# Enhanced right prompt with additional info
#RPROMPT='%F{245}%D{%H:%M:%S}%f'

# ====================================================================
# ENHANCED ALIASES - Comprehensive and intuitive
# ====================================================================

# Intelligent ls aliases with Vim-inspired colors
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G --color=auto'
    alias ll='ls -lhG --color=auto'
    alias la='ls -lahG --color=auto'
    alias lt='ls -ltrhG --color=auto'
else
    alias ls='ls --color=auto -h'
    alias ll='ls -lh --color=auto'
    alias la='ls -lah --color=auto'
    alias lt='ls -ltrh --color=auto'
fi

# Enhanced directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'
alias d='dirs -v | head -10'  # Show directory stack

# Safe file operations
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
alias rmdir='rmdir -v'

# Advanced file viewing
alias cat='cat -n'
alias less='less -R'
alias more='less'
alias head='head -n 20'
alias tail='tail -n 20'

# Git workflow - comprehensive
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'
alias gs='git status --short'
alias gss='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --oneline --graph --all --decorate -20'
alias gll='git log --graph --pretty=format:"%C(yellow)%h%Creset %C(blue)%an%Creset %C(green)%ar%Creset %s %C(yellow)%d%Creset" --all -20'
alias gb='git branch -v'
alias gba='git branch -av'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
alias gr='git remote -v'
alias gst='git stash'
alias gstp='git stash pop'

# Development shortcuts
alias py='python3'
alias py2='python2'
alias pip='pip3'
alias v='vim'
alias vi='vim'
alias c='code'
alias n='nano'

# System monitoring - enhanced
alias df='df -h'
alias du='du -h'
alias dus='du -sh'
alias free='free -h'
alias ps='ps aux'
alias psg='ps aux | grep'
alias top='top -o cpu'
alias htop='htop -C'
alias ports='netstat -tuln'

# Network utilities
alias ping='ping -c 5'
alias wget='wget -c'
alias curl='curl -L'

# Archive operations
alias tarx='tar -xvf'
alias tarc='tar -cvf'
alias targz='tar -czvf'

# Quick editing
alias zshrc='${EDITOR:-vim} ~/.zshrc'
alias vimrc='${EDITOR:-vim} ~/.vimrc'
alias hosts='sudo ${EDITOR:-vim} /etc/hosts'

# ====================================================================
# ENHANCED FUNCTIONS - Powerful utilities
# ====================================================================

# Intelligent cd with ls and git status
cd() {
    builtin cd "$@" || return $?
    
    # Show directory contents (limited to prevent spam)
    local file_count=$(ls -1 | wc -l | tr -d ' ')
    if [[ $file_count -le 50 ]]; then
        ls
    else
        echo "Directory contains $file_count files (too many to list)"
        ls | head -20
        echo "... and $(($file_count - 20)) more files"
    fi
    
    # Show git status if in a git repo
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo ""
        git status --short --branch
    fi
}

# Enhanced directory creation
mkcd() {
    if [[ $# -ne 1 ]]; then
        echo "Usage: mkcd <directory>"
        return 1
    fi
    mkdir -p "$1" && cd "$1"
}

# Intelligent find
ff() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: ff <pattern> [path]"
        return 1
    fi
    local pattern="$1"
    local path="${2:-.}"
    find "$path" -iname "*$pattern*" 2>/dev/null | head -50
}

# Find in files
fif() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: fif <pattern> [path]"
        return 1
    fi
    local pattern="$1"
    local path="${2:-.}"
    grep -r -n --color=always "$pattern" "$path" 2>/dev/null | head -50
}

# Enhanced extract function
extract() {
    if [[ $# -ne 1 ]]; then
        echo "Usage: extract <archive>"
        return 1
    fi
    
    if [[ ! -f "$1" ]]; then
        echo "Error: '$1' is not a valid file"
        return 1
    fi
    
    case "$1" in
        *.tar.bz2)   tar xjf "$1"     ;;
        *.tar.gz)    tar xzf "$1"     ;;
        *.tar.xz)    tar xf "$1"      ;;
        *.bz2)       bunzip2 "$1"     ;;
        *.rar)       unrar x "$1"     ;;
        *.gz)        gunzip "$1"      ;;
        *.tar)       tar xf "$1"      ;;
        *.tbz2)      tar xjf "$1"     ;;
        *.tgz)       tar xzf "$1"     ;;
        *.zip)       unzip "$1"       ;;
        *.Z)         uncompress "$1"  ;;
        *.7z)        7z x "$1"        ;;
        *.deb)       ar x "$1"        ;;
        *.tar.zst)   unzstd "$1"      ;;
        *.zst)       unzstd "$1"      ;;
        *)           echo "Error: '$1' cannot be extracted via extract()" ;;
    esac
}

# Quick backup with timestamp
bak() {
    if [[ $# -ne 1 ]]; then
        echo "Usage: bak <file>"
        return 1
    fi
    local timestamp=$(date +%Y%m%d_%H%M%S)
    cp "$1" "${1}.bak_${timestamp}"
    echo "Backed up '$1' to '${1}.bak_${timestamp}'"
}

# Process management
pskill() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: pskill <process_name>"
        return 1
    fi
    ps aux | grep "$1" | grep -v grep | awk '{print $2}' | xargs kill -9
}

# Directory size analysis
dirsize() {
    local path="${1:-.}"
    du -sh "$path"/* 2>/dev/null | sort -hr | head -20
}

# ====================================================================
# ENVIRONMENT SETUP - Optimized for development
# ====================================================================

# Enhanced PATH management
typeset -U path
path=(
    $HOME/bin
    $HOME/.local/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/bin
    /bin
    /usr/sbin
    /sbin
    $path
)

# Core environment
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export MANPAGER='less'
export BROWSER='open'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Vim-inspired color environment
export LS_COLORS="di=38;5;180:ln=38;5;117:so=38;5;146:pi=38;5;180:ex=38;5;150:bd=38;5;180:cd=38;5;180:su=38;5;174:sg=38;5;174:tw=38;5;180:ow=38;5;180:*.tar=38;5;174:*.tgz=38;5;174:*.zip=38;5;174:*.gz=38;5;174:*.bz2=38;5;174:*.xz=38;5;174:*.py=38;5;186:*.js=38;5;186:*.html=38;5;146:*.css=38;5;117:*.json=38;5;186:*.xml=38;5;146:*.yml=38;5;117:*.yaml=38;5;117:*.md=38;5;253"

export CLICOLOR=1
export LSCOLORS="gxGxCxDxBxEgEdAbAgAcAd"

# Enhanced grep colors
export GREP_COLOR='38;5;215'
export GREP_COLORS='ms=38;5;215:mc=38;5;174:sl=:cx=:fn=38;5;117:ln=38;5;180:bn=38;5;245:se=38;5;245'

# Less configuration
export LESS='-R -i -F -X -M -x4'
export LESSHISTFILE='-'
export LESS_TERMCAP_mb=$'\e[1;31m'     # Begin blinking
export LESS_TERMCAP_md=$'\e[1;36m'     # Begin bold
export LESS_TERMCAP_me=$'\e[0m'        # End mode
export LESS_TERMCAP_so=$'\e[01;44;33m' # Begin standout
export LESS_TERMCAP_se=$'\e[0m'        # End standout
export LESS_TERMCAP_us=$'\e[1;32m'     # Begin underline
export LESS_TERMCAP_ue=$'\e[0m'        # End underline

# Performance optimizations
export KEYTIMEOUT=1
export LISTMAX=0

# Development environment
export PYTHONDONTWRITEBYTECODE=1
export PIP_REQUIRE_VIRTUALENV=false
export NODE_OPTIONS="--max-old-space-size=4096"

# ====================================================================
# CONDITIONAL LOADING - Intelligent tool detection
# ====================================================================

# Node Version Manager
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh"
    [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
fi

# Homebrew (multiple locations)
for brew_path in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
    if [[ -x "$brew_path" ]]; then
        eval "$($brew_path shellenv)"
        break
    fi
done

# Rust/Cargo
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Python environment managers
[[ -f "$HOME/.pyenv/bin/pyenv" ]] && {
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
}

# Ruby Version Manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Go environment
[[ -d "/usr/local/go/bin" ]] && export PATH="/usr/local/go/bin:$PATH"
[[ -d "$HOME/go/bin" ]] && export PATH="$HOME/go/bin:$PATH"

# ====================================================================
# ENHANCED ZSH PLUGINS - With Vim-inspired styling
# ====================================================================

# Auto-suggestions with Vim styling
if [[ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245,italic'  # Vim comment style
    export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    export ZSH_AUTOSUGGEST_USE_ASYNC=1
fi

# Syntax highlighting with complete Vim color integration
if [[ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    
    # Comprehensive Vim Minimal Dark color scheme
    typeset -A ZSH_HIGHLIGHT_STYLES
    ZSH_HIGHLIGHT_STYLES[default]='fg=253'                           # Normal: #dadada
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=174,bold'                # Error: #d78787
    ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=110'                     # Statement: #87afd7
    ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=150,underline'            # Function: #afd787
    ZSH_HIGHLIGHT_STYLES[global-alias]='fg=150'                      # Function: #afd787
    ZSH_HIGHLIGHT_STYLES[precommand]='fg=110,underline'              # Statement: #87afd7
    ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=117'                  # Operator: #87d7ff
    ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=180,underline'           # Constant: #d7af87
    ZSH_HIGHLIGHT_STYLES[path]='fg=117'                              # Identifier: #87d7ff
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=248'                # Delimiter: #a8a8a8
    ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=248'         # Delimiter: #a8a8a8
    ZSH_HIGHLIGHT_STYLES[globbing]='fg=215'                          # Special: #ffaf5f
    ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=215,bold'            # Special: #ffaf5f
    ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=146'              # Type: #afafd7
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=146'    # Type: #afafd7
    ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=146'              # Type: #afafd7
    ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=146'    # Type: #afafd7
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=180'              # Constant: #d7af87
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=180'              # Constant: #d7af87
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=186'              # String: #d7d787
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=186'            # String: #d7d787
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=186'            # String: #d7d787
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=186'            # String: #d7d787
    ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=186'                          # String: #d7d787
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=139'     # Number: #af87af
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=139'       # Number: #af87af
    ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=139'       # Number: #af87af
    ZSH_HIGHLIGHT_STYLES[assign]='fg=117'                            # Identifier: #87d7ff
    ZSH_HIGHLIGHT_STYLES[redirection]='fg=215,bold'                  # Special: #ffaf5f
    ZSH_HIGHLIGHT_STYLES[comment]='fg=245,italic'                    # Comment: #8a8a8a
    ZSH_HIGHLIGHT_STYLES[named-fd]='fg=180'                          # Constant: #d7af87
    ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=139'                        # Number: #af87af
    ZSH_HIGHLIGHT_STYLES[arg0]='fg=150'                              # Function: #afd787
    ZSH_HIGHLIGHT_STYLES[builtin]='fg=110'                           # Statement: #87afd7
    ZSH_HIGHLIGHT_STYLES[function]='fg=150'                          # Function: #afd787
    ZSH_HIGHLIGHT_STYLES[command]='fg=150'                           # Function: #afd787
    ZSH_HIGHLIGHT_STYLES[alias]='fg=150,underline'                   # Function: #afd787
    ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=150,underline'            # Function: #afd787
    ZSH_HIGHLIGHT_STYLES[global-alias]='fg=150,underline'            # Function: #afd787
    ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=150'                    # Function: #afd787
fi

# History substring search with Vim colors
if [[ -f "/opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]; then
    source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=238,fg=215,bold'      # Search match
    export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=124,fg=255,bold'  # No match
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi

# ====================================================================
# KEY BINDINGS - Vim-inspired navigation
# ====================================================================

# Vim-like line editing
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^Y' yank
bindkey '^E' end-of-line
bindkey '^A' beginning-of-line
bindkey '^D' delete-char
bindkey '^F' forward-char
bindkey '^B' backward-char
bindkey '^K' kill-line
bindkey '^U' kill-whole-line
bindkey '^W' backward-kill-word
bindkey '^H' backward-delete-char

# Enhanced word movements
bindkey '^[b' backward-word
bindkey '^[f' forward-word

# Completion navigation
bindkey '^[[Z' reverse-menu-complete  # Shift+Tab

# ====================================================================
# FINAL OPTIMIZATIONS
# ====================================================================

# Clean up duplicates in PATH
typeset -U path cdpath fpath manpath

# Load local customizations
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Performance monitoring (optional - uncomment to enable)
# zmodload zsh/zprof

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# bun completions
[ -s "/Users/eightharsh/.bun/_bun" ] && source "/Users/eightharsh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"





#zoxide 
eval "$(zoxide init zsh)"

