###################################################
# The wonderful bash profile of Marco Kunz				#
# If you don't like shortcuts, you're not german  #
###################################################

###################################################
# Get started in the morning											#
###################################################

## The "At Work" Version
alias meh="
	open /Applications/Mail.app;
	open "https://github.com/";
	open "https://trello.com/";
	open /Applications/Skype.app;
	open /Applications/Sublime\ Text\ 2.app;
	open /Applications/Pastor.app;
  echo "Wonderful. You are good to go. Have a nice day.""

## The "Let's get Gaming" Version
alias yay="open /Applications/Battle.net.app;"

###################################################
# Launching apps being used very often						#
###################################################

## Start only Firefox															#
alias fire="open /Applications/Firefox.app;"
## Start Filezilla																#
alias fizi="open /Applications/Filezilla.app"
## Start Photoshop																#
alias chop="open /Applications/Adobe\ Photoshop\ CS6/AdobePhotoshopCS6.app"

###################################################
# Get started with developing											#
###################################################

#	Move around the computer												#
# cd to my Git directory aka "Go Git 'em Tiger!"	#
# See .gitconfig for the aliases to work with Git #
alias gogitem="cd Sites/Git/"
# Going up
alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
# Open the current directory in Finder
# (with invisibles)
alias f='open -a Finder ./'

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
# Set Mac to sleep. "Go home Mac! You're drunk!"	#
alias zzz="pmset sleepnow"

# IP Stuff
# Show me the public facing IP Address
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
# Show the local IP Address
alias localip="ipconfig getifaddr en1"


###################################################
# Web Development																	#
###################################################

# Start the watch task of Grunt anywhere
alias gruwa="grunt watch"
# Apache related stuff
# Make changes to the apache configuration
alias apacheedit='sudo subl /etc/httpd/httpd.conf'
# Restart apache afterwards to make it see those
# changes you made
alias apacherestart='sudo apachectl graceful'
# Gimme those errors
alias apachelogs="less +F /var/log/apache2/error_log"
# Host files
# Make changes to your hosts file
alias edithosts='sudo subl /etc/hosts'
# Make changes to your vhosts file
alias editvhosts="sudo subl /etc/apache2/extra/httpd-vhosts.conf"

###################################################
# Connecting with Smashing Servers								#
###################################################
source .bash_work