# WELCOME
## don't run this if over ssh (i.e. a server)
if [[ ! -v SSH_TTY ]] ; then
	
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
	
	script() {
		audio_vol
		[[ $(ps -ef | grep xbindkeys | grep -v grep | wc -l) -eq 0 ]] && xbindkeys
		tmux new -s main
	}
	
	tmux list-sessions >/dev/null 2>&1 || script
	# run on first tmux pane
	if [[ $TMUX_PANE == "%0" ]] && [[ ! -v VIMRUNTIME ]]; then
		$HOME/bin/ahoy
	fi
	#cat ~/tmp/logo5
fi
