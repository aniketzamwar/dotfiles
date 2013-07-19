
echo -e "Kernel Information: " `uname -smr`
echo -e "${COLOR_BROWN}`bash --version`"
echo -ne "${COLOR_GRAY}Uptime: "; uptime
echo -ne "${COLOR_GRAY}Server time is: "; date

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


#-------------------------------------------------------------
# Bookmarking of folders and files
#-------------------------------------------------------------
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
    touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
    command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"="`pwd`" >> ~/.dirs; source ~/.dirs ; 
}
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

#-------------------------------------------------------------
# Misc
#-------------------------------------------------------------
alias g='grep -i'  #case insensitive grep
alias f='find . -iname'
alias ducks='du -cks * | sort -rn|head -11' # Lists the size of all the folders and files
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"