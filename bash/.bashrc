# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc

# User specific aliases and functions

function cd {
  builtin cd "$@" && ls -l --color=auto
}

