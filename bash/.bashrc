# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# pipe commands to vh
# uses nc to send output to virtualhacker.net port 9999
# returns a url for distribution. WARN:PLAIN TEXT
alias vh='nc virtualhacker.net 9999'
alias ls='ls -A --color=auto'
alias l='ls -1'
alias llfile='ls -l | grep -v ^d'
alias lldir='ls -l | grep ^d'

function cd {
	builtin cd "$@" && ls -l
}


# Bash doesn't like colors
# Writes over same line
# export PS1="\e[0;33m[\u@\h]\$ \e[m"
export PS1="[\u@\h \W]\$ "
