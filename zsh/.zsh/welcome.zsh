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
  tmux new -s main -n '~'
}

getnews() {
	curl 'https://newsapi.org/v2/top-headlines' -s -G \
	-d sources=$1 \
	-d pageSize=5 \
	-d apiKey=$NEWS_API_KEY | jq -r '.articles[] | .title, .url, ""' | tr -d '\t'
}

set -o vi
cat ~/tmp/pyratebeard_ansi_md

if [[ ${PTS} -lt "2" ]] ; then 
  script
fi

if [[ ${TMUX_PANE} == '%0' ]] ; then
	echo -e "\n// WELCOME $(whoami | tr 'a-z' 'A-Z')\n"
	echo -e "\nIRISH NEWS HEADLINES:"
	getnews the-irish-times
	echo -e "\nHACKER NEWS HEADLINES:"
	getnews hacker-news
fi
