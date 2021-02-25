# ALIASES
alias ll="ls -lahF --color=auto"
alias ls="ls -hF --color=auto"
alias lsl="ls -lhF --color=auto"
alias "cd.."="cd ../"
alias up="cd ../"
alias rmrf="rm -rf"
alias psef="ps -ef"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias scp="scp -r"
alias mkdir="mkdir -p"
alias xsel="xsel -b"
alias fuck='sudo $(fc -ln -1)'
alias v="vim"
alias vi="vim"
alias emacs="vim"
alias g="git"
alias ga="git add"
alias gb="git branch | grep \*"
alias gc="git commit -S -m"
alias gs="git status"
alias gd="git diff"
alias gf="git fetch"
alias gm="git merge"
alias gr="git rebase"
alias gp="git push"
alias gu="git unstage"
alias gg="git log --graph"
alias gco="git checkout"
alias gpr="git request-pull"
alias ag="ag --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'"
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias rock="mpd .mpd/mpd.conf ; ncmpcpp"
alias mixer="alsamixer"
alias term="urxvtc -hold -e " #used for run menu
alias pacman="sudo pacman"
alias update="pacman -Syu"
alias systemctl="sudo systemctl"
alias :q="sudo systemctl poweroff"
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'
alias record="ffmpeg -f x11grab -s 1366x768 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y" #pass a filename
alias gifview="gifview -a"
alias reboot="sudo reboot"
alias vh="nc vhbin.net 9999"
alias kb="keybase"
alias dd="dd status=progress"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
alias ncmpcpp="ncmpcpp -q"
alias song="ncmpcpp --current-song='$7%a - $8{%n} {%t} $R [{%l}] ' | cut -d '%' -f 1"
alias jobs="jobs -l"
alias dnf="sudo dnf"
alias irc="TERM=screen-256color dtach -A /tmp/irc irssi"
alias ap="ansible-playbook"
alias tf="terraform"
alias tfi="terraform init"
alias tfa="terraform apply --auto-approve"
alias tfp="terraform plan"
alias tfd="terraform destroy"
alias tor="cd ~/src/warez/tor/ ; ./start-tor-browser.desktop"
alias failover="sudo ip link set enp5s0 down"
alias failback="sudo ip link set enp5s0 up"
alias netctl="sudo netctl"
alias feh="feh -g 640x480"
alias rum.sh="nc rum.sh 9999"
alias headsetbatt="bluetooth_battery 34:DF:2A:5F:04:2C"
alias connect-headset="echo 'connect 34:DF:2A:5F:04:2C' | bluetoothctl"
alias moebius="cd $HOME/src/warez/moebius ; /usr/bin/npm start"
alias cointop="$HOME/src/go/bin/cointop --hide-statusbar"
alias nodisturb="/usr/bin/notify-send 'DUNST_COMMAND_PAUSE'"
alias disturb="/usr/bin/notify-send 'DUNST_COMMAND_RESUME'"
alias sacc="PAGER=less sacc"

alias -s md=vim
alias -s {png,jpg,jpeg}=sxiv
alias -s pdf=zathura

email() {
  echo $3 | mutt -s $2 $1
}
# colorised cat
c() {
  for file in "$@"
  do
    pygmentize -O style=sourcerer -f console256 -g "$file" 
  done
}
# colorised less
#l() {
#  pygmentize -O style=sourcerer -f console256 -g $1 | less -r 
#}
# read markdown files like manpages
md() {
    pandoc -s -f markdown -t man "$*" | man -l -
}
webman() {
	curl "$@" | pandoc -s -f html -t man | man -l -
}
nam() {
	pandoc -s -t man "$*" | man -l -
}
ssux() {
	TERM=screen ssh -t "$@" 'tmux attach || tmux new' || ssh "$@"
}

screencast() {
	RESOLUTION=$(xrandr | grep "*" | awk '{print $1}')
	ffmpeg -f x11grab -s $RESOLUTION -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y $HOME/lib/videos/recordings/screencasts/$(date +%Y%m%d)-${1}
}

webcapture() {
	NUM=$(ls -l $HOME/tmp/*webcapture*|wc -l)
	NUM=$(( NUM + 1 ))
	ffmpeg -f video4linux2 -s 640x480 -i /dev/video0 -ss 0:0:2 -frames 1 $HOME/tmp/$(date +%Y%m%d)-webcapture-${NUM}.png
}
