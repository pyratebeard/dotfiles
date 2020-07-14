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
	if [[ ${PTS} -lt "2" ]] ; then 
		audio_vol
		tmux new -s main -n '~'
		if [[ ${TMUX_PANE} == '%0' ]] ; then
			~/bin/greetings
		fi
	fi
}

set -o vi
script
