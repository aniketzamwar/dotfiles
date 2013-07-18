
#-------------------------------------------------------------
# Display settings and colors
#-------------------------------------------------------------
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#-------------------------------------------------------------
# Bash history
#-------------------------------------------------------------
# History length.
HISTSIZE=1000
# Bash history file length.
HISTFILESIZE=10000
# Don't put duplicate lines in the history. See bash(1) for more
# options or force ignoredups and ignorespace.
HISTCONTROL=ignoredups:ignorespaec
# Append the history to the histfile instead of overwriting it.
shopt -s histappend
# Update & re-read histfile after every cmd so terminals will share.
export PROMPT_COMMAND="history -n; history -a"

#-------------------------------------------------------------
# Generic Aliases
#-------------------------------------------------------------
alias l="ls -al"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias du='du -kh'
alias df='df -kTh'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

#-------------------------------------------------------------
# ls aliases
#-------------------------------------------------------------
alias ll='ls -l'
alias ls='ls -hF'          # add colors for filetype recognition
alias la='ls -lah'         # show hidden files
alias lx='ls -lXBh'        # sort by extension
alias lk='ls -lSh'         # sort by size, biggest last
alias lt='ls -lth'         # sort by date, most recent first
alias ltr='ls -ltrh'       # sort by date, most recent last

#-------------------------------------------------------------
# Get readable list of network IPs
#-------------------------------------------------------------
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

