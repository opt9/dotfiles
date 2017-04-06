# for Emacs Tramp
# https://www.emacswiki.org/emacs/TrampMode#toc8
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/jeremy/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="steeef"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]; then
#	source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
# fi

# export PATH=$PATH:/usr/local/go/bin

export TERM=xterm-256color

alias pkginstall='sudo apt-get install'
alias pkgupdate='sudo apt-get update && sudo apt-get upgrade'
alias pkginfo='apt-cache show'
alias pkgsearch='apt-cache search'
alias pkgremove='sudo apt-get purge'
alias autoremove='sudo apt-get autoremove'

alias bc='bc -l'
alias mount='mount | column -t'

alias ports='netstat -tulanp'
alias connections='sudo lsof -n -P -i +c 15'
alias most='du -hsx * | sort -rh | head -10'
alias fw='sudo iptables -nvL --line-numbers'
alias aswhois='f() { whois -h whois.cymru.com " -v $@" }; f'
alias sshbot='for h in `sudo iptables -S f2b-sshd | awk '"'"'{ print $4 }'"'"' | cut -d"/" -f1 | grep -v RETURN | sort | uniq`; do aswhois -f $h; done'
alias badlog='for h in `sudo lastb | awk '"'"'{print $3}'"'"' | sort | uniq | grep "^[0-9].*"`; do aswhois -f $h; done'

alias trans='gawk -f <(curl -Ls git.io/translate) "$@"'
alias weather='curl wttr.in/seoul'
alias moon='curl wttr.in/moon'

