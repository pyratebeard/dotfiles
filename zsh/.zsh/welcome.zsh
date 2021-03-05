# WELCOME

PTS=$(ps -U $USER | awk '{ print $2 }' | grep "pts/" | uniq | wc -l)

audio_vol() {
	_master="Master"
	_usb="Dell USB Audio"
	
	if amixer | grep "$_master" >/dev/null ; then
	  amixer sset "$_master" 40% >/dev/null
	elif amixer | grep "$_usb" >/dev/null ; then
	  amixer sset "$_usb" 25% >/dev/null
	fi
}

# script run on first terminal
script() {
	cat ~/tmp/pyratebeard_ansi_md
	if [[ ${PTS} -eq "2" ]] ; then
		audio_vol
		tmux new -s main -n '~'
		hashwall -f '#131313' -b '#1e1b1c'  -s 12
		if [[ ${TMUX_PANE} == '%0' ]] ; then
			~/bin/ahoy
		fi
	fi
}

set -o vi
script
