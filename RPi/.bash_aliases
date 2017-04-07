# Start calculator with math support
alias bc='bc -l'
alias mount='mount | column -t'
alias ports='netstat -tulanp'
alias connections='sudo lsof -n -P -i +c 15'
alias mg='mg -n'

# Tmux management
alias tl='tmux list-sessions'
alias ts='tmux new -s'
alias ta='tmux attach'

# Package management
alias pkgsearch='apt-cache search'
alias pkginstall='sudo apt-get install'
alias pkgremove='sudo apt-get purge'
alias pkgupdate='sudo apt-get update && sudo apt-get upgrade'
alias pkginfo='apt-cache show'
alias kernelupdate='sudo apt-get update && sudo apt-get dist-upgrade'
alias autoremove='sudo apt-get autoremove'

# Disk management
alias most='du -hsx * | sort -rh | head -10'

# Incident Response
alias fw='sudo iptables -nvL --line-numbers'
alias aswhois='whois -h whois.cymru.com " -v -f $@"'
alias sshbot='for h in `sudo iptables -S fail2ban-ssh | awk '"'"'{ print $4 }'"'"' | cut -d"/" -f1 | grep -v RETURN | sort | uniq`; do aswhois $h; done'
alias badlog='for h in `sudo lastb -i | awk '"'"'{ print $3 }'"'"' | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sort | uniq`; do aswhois $h; done'

# Weather
alias weather='curl wttr.in/seoul'
alias moon='curl wttr.in/moon'

# Editor config
alias emacs='jmacs'
alias editor='mg -n'
alias vi='mg -n'
alias view='mg -n -f toggle-read-only'

# Git convenient
alias ga='git add --all'
alias glola="git log --all --graph --decorate --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gba='git branch -va'
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gcount='git shortlog -sn'
alias gcf='git config --list'
alias gcam='git commit -a -m'
alias gst='git status'
alias gd='git diff'
alias gdca='git diff --cached'
alias gp='git push'
alias gpu='git push upstream'
alias gr='git remote -v'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
