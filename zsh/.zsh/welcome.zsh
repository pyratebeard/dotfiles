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
  audio_vol
  tmux new -s main
}

set -o vi
cat ~/tmp/pyratebeard_ansi_md
if [[ ${PTS} -lt "2" ]] ; then 
  hashwall -b '#2e2c2a' -f '#4f5090' -s 12
  script
fi
