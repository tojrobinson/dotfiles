[ -z "$PS1" ] && return

# prompt
PS1='\[\e[34m\](\W)>\[\e[0m\] '

# command history
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# refresh $COLUMNS and $LINES
shopt -s checkwinsize 

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# color
if [ -x /usr/bin/dircolors ]
then
    [ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# programmable completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# aliases
[ ! -d ~/.trash ] && mkdir ~/.trash
alias rm="mv --backup=numbered -t ~/.trash"
trash() {
   TRASH_SIZE=$(du -hs ~/.trash | egrep -o '^\s*\w+')
   read -p "Completely remove all files from .trash (${TRASH_SIZE}) [y/n]? " CONFIRM 
   [ "$CONFIRM" = "y" ] && sudo find ~/.trash -mindepth 1 -maxdepth 1 -exec rm -rf '{}' \;
}

alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# db
PATH=/usr/local/pgsql/bin:$PATH
PATH=/usr/lib/mongo/mongodb-linux-x86_64-2.4.8/bin:$PATH

# amazon
PATH=$PATH:/usr/lib/amazon/AWS-ElasticBeanstalk-CLI-2.5.1/eb/linux/python2.7
PATH=$PATH:~/Downloads/play/play-2.2.1

export VISUAL='/usr/bin/vim'
export EDITOR='/usr/bin/vim'
export PATH=$PATH
