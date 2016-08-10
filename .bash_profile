###################################################
# The wonderful bash profile of Marco Kunz        #
# If you don't like shortcuts, you're not german  #
###################################################

###################################################
# Everytime I change this file I need to source   #
###################################################
alias sbash="source .bash_profile"

###################################################
# Getting started in the morning                  #
###################################################

## The "At Work" Version
alias meh="
  open /Applications/Mail.app;
  open "https://github.com/";
  open "https://trello.com/";
  open /Applications/Skype.app;
  open /Applications/Sublime\ Text\ 2.app;
  open /Applications/Pastor.app;"

###################################################
# Launching apps being used very often            #
###################################################

## Start only Firefox
alias fire="open /Applications/Firefox.app"
## Start Filezilla
alias fizi="open /Applications/Filezilla.app"
## Start Photoshop
alias chop="open /Applications/Adobe\ Photoshop\ CC\ 2015/Adobe\ Photoshop\ CC\ 2015.app"
## Start iTunes
alias music="open /Applications/iTunes.app"
## Start Pastor
alias pass="open /Applications/Pastor.app"

###################################################
# Get started with developing                     #
###################################################

# Move around the computer
# cd to my Git directory aka "Go Git 'em Tiger!"
# See .gitconfig for the aliases to work with Git
alias gogitem="cd Sites/Git/"

# Ignore a file completely from development cycles
alias au='git update-index --assume-unchanged'
alias nau='git update-index --no-assume-unchanged'

###################################################
# Better Terminal                                 #
###################################################

# “What was that alias again?” Meta!
alias aliases="sublime .bash_profile"

# Clearing the console
alias cl='clear'

# Going up
alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias ~='cd ~'

# Taking the elevator thanks to https://github.com/Lykathia
elevator () {
    svn info &> /dev/null
    if [ $? -eq 0 ]; then
        cd `svn info | grep 'Working Copy' | sed 's|Working Copy Root Path: \(.*\)$|\1|g'`
    else
        cd $(git rev-parse --show-toplevel)
    fi
}
alias elv="elevator"

# Open the current directory in Finder
# (with invisibles)
alias f='open -a Finder ./'

# Add colors to lists
alias ls='ls -Glah'

# Git branch in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Mac stuff
# Show hidden files or do not show hidden files
# in Finder of course
alias finderShow='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHide='defaults write com.apple.finder ShowAllFiles FALSE'
# Hide or show all desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
# Delete all .DS_Store files - and do it recursively
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
# Set Mac to sleep. "Go home Mac! You're drunk!"
alias zzz="pmset sleepnow"

# IP Stuff
# Show me the public facing IP Address
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
# Show the local IP Address
alias localip="ipconfig getifaddr en1"

# History is a good thing - mostly
# Erase duplicates in history
export HISTCONTROL=erasedups

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Looking for updates with a single command is beautiful
# We are updating Homebrew, NPM and our Mac OS with this
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; npm update npm -g; npm update -g'

###################################################
# Web Development                                 #
###################################################

# Open Stuff in Sublime Text
alias s="sublime"
# Gitting
alias g="git"
# Open any files marked as “modified” in your default editor.
alias changed='open `git status --porcelain | sed -ne "s/^ M //p"`'
# Start the watch task of Grunt anywhere
alias gruwa="grunt watch"
# Apache related stuff
# Make changes to the apache configuration
alias apacheedit='sudo sublime /etc/apache2/httpd.conf'
# Restart apache afterwards to make it see those
# changes you made
alias apacherestart='sudo apachectl graceful'
# Gimme those errors
alias apachelogs="less +F /var/log/apache2/error_log"
# Host files
# Make changes to your hosts file
alias edithosts='sudo sublime /etc/hosts'
# Make changes to your vhosts file
alias editvhosts="sudo sublime /etc/apache2/extra/httpd-vhosts.conf"
# Create a new public key
alias createkey="ssh-keygen -b 8192"
# Show me the public key
alias showkey="cat ~/.ssh/id_rsa.pub"
# Make .gitconfig in ~ global
alias gignore="git config --global core.excludesfile ~/.gitignore"

###################################################
# Connecting with Smashing Servers                #
###################################################
source .bash_work
