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
alias git="hub"
alias g="hub"
alias ga="git add"
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
alias gpr="hub pull-request"
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
l() {
  pygmentize -O style=sourcerer -f console256 -g $1 | less -r 
}
# read markdown files like manpages
md() {
    pandoc -s -f markdown -t man "$*" | man -l -
}
tmush() {
	ssh -t "$@" 'tmux attach || tmux new'
}
