# script run on first terminal

PTS=$(ps -U $USER | awk '{ print $2 }' | grep "pts/" | uniq | wc -l)

script() {
  sysinfo2
  topydo
}

setxkbmap -option ctrl:nocaps
set -o vi

if [[ ${PTS} -lt "2" ]] ; then 
  script
fi
