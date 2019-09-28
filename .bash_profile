# Include path for Homebrew
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Set Terminal to PHP 7.2
export PATH="/usr/local/opt/php@7.2/bin:$PATH"

# Erase duplicates in bash_history
export HISTCONTROL=erasedups

# Open files in Sublime Text
alias s="subl"

# See this file
alias aliases="subl .bash_profile"

# Source this file
alias sbash="source .bash_profile"

# Console helpers
# Go to my git folder
alias gogitem="cd Sites/Git/"

# Clear Terminal
alias cl="clear"

# Going upwards
alias cd..="cd ../"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .5="cd ../../../../"
alias .6="cd ../../../../../"
alias ~="cd ~"

# Show me the git branch in terminal prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Taking the elevator in a Git repository
elevator () {
  svn info &> /dev/null
  if [ $? -eq 0 ]; then
    cd `svn info | grep 'Working Copy' | sed 's|Working Copy Root Path: \(.*\)$|\1|g'`
  else
    cd $(git rev-parse --show-toplevel)
  fi
}
alias elv="elevator"

# Open current directory in Finder
alias f="open -a Finder ./"

# Add color to lists
alias ls="ls -Glah"

# Development Things
alias g="git"
alias gruwa="grunt watch"
alias nrd="npm run dev"
alias nrb="npm run build"

# Make git ignore file a global thing
alias gignore="git config --global core.excludesfile ~/.gitignore"

# Server Things
alias apacheedit="sudo subl /usr/local/etc/httpd/httpd.conf"
alias apacherestart="sudo apachectl graceful"
alias apachelogs="less +F /usr/local/var/log/httpd/error_log"
alias edithosts="sudo subl /etc/hosts"
alias editvhosts="sudo subl /usr/local/etc/httpd/extra/httpd-vhosts.conf"
alias createkey="ssh-keygen -b 8192"
alias showkey="cat ~/.ssh/id_rsa.pub"

# Show me the public facing IP Address
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# Show the local IP Address
alias localip="ipconfig getifaddr en1"

# Mac stuff
# Show hidden files or do not show hidden files
alias finderShow='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHide='defaults write com.apple.finder ShowAllFiles FALSE'

# Hide or show all desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Delete all .DS_Store files - and do it recursively
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# Set Mac to sleep. "Go home Mac! You're drunk!"
alias zzz="pmset sleepnow"

# Typing g adda wrong may result in dadjokes now.
alias gdad="dadjoke"

alias fuck="rm -rf Data/Temporary && php flow doctrine:migrate && php flow category:removeunused && php flow identifier:regenerate && php flow articles:synchronize && php flow weather:synchronize && php flow map:buildarticlecache && php flow indexer:run && php flow flow:cache:flush --force && php flow database:setcharset && php flow node:repair --only createMissingChildNodes && php flow doctrine:update && php flow packages:synchronize"
