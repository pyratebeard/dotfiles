#                 ██
#                ░██
#  ██████  ██████░██
# ░░░░██  ██░░░░ ░██████
#    ██  ░░█████ ░██░░░██
#   ██    ░░░░░██░██  ░██
#  ██████ ██████ ░██  ░██
# ░░░░░░ ░░░░░░  ░░   ░░
# s h e l l  a l i a s e s
#
#  author ▓▒ pyratebeard
#    code ▓▒ https://git.pyratebeard.net/dotfiles/file/zsh/.zsh/aliases.zsh.html

# ▓▓▒░ root
# check for doas so aliases can be used on different systems
# add whitespace for hack to make aliases woth with {sudo,doas}
command -v doas >/dev/null && \
    alias sudo='doas ' || \
    alias sudo='sudo '

# ▓▓▒░ sys
                                                                        alias \
    ll="ls -lahF --color=auto"                                                \
    ls="ls -hF --color=auto"                                                  \
    lsl="ls -lhF --color=auto"                                                \
    llrt="ls -lahFrt --color=auto"                                            \
                                                                              \
    cp="cp -r"                                                                \
    rmrf="rm -rf"                                                             \
    scp="scp -r"                                                              \
                                                                              \
    up="cd ../"                                                               \
    mkdir="mkdir -p"                                                          \
                                                                              \
    xsel="xsel -b"                                                            \
    fuck='sudo $(fc -ln -1)'                                                  \
    dd="dd status=progress"                                                   \
                                                                              \
    term="urxvtc -hold -e "                                                   \
                                                                              \
    reboot="sudo reboot"                                                      \
    systemctl="sudo systemctl"


# ▓▓▒░ info
                                                                        alias \
    psef="ps -ef"                                                             \
    jobs="jobs -l"                                                            \
    \?is="whereis"                                                            \
    disks='echo "┌──┄";echo "├┄ m o u n t . p o i n t s"; echo "└──┄┄────┄┄"; lsblk -a; echo ""; echo "┌──┄";echo "├┄ d i s k . u s a g e"; echo "└──┄┄────┄┄"; sudo df -h -x tmpfs -x devtmpfs;' \
    ag="ag --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'" \
    tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'


# ▓▓▒░ almighty text editor
                                                                        alias \
    v="vim"                                                                   \
    vi="vim"                                                                  \
    emacs="vim"


# ▓▓▒░ git
                                                                        alias \
    g="git"                                                                   \
    ga="git add"                                                              \
    gb="git branch"                                                           \
    gc="git commit -S -m"                                                     \
    gs="git status -sb"                                                       \
    gd="git diff"                                                             \
    gf="git fetch"                                                            \
    gm="git merge"                                                            \
    gr="git rebase"                                                           \
    gp="git push"                                                             \
    gu="git unstage"                                                          \
    gg="git log --graph"                                                      \
    gco="git checkout"                                                        \
    gsm="git status -sbuno"                                                   \
    gpr="git request-pull"                                                    \
    ggg="git graphgpg"

    gcl() {
        git clone "$1"
        cd ${1##*/}
    }


# ▓▓▒░ pacman
                                                                        alias \
    pac="sudo pacman"                                                         \
    pacman="sudo pacman"                                                      \
    update="sudo paccache -r ; pacman -S --noconfirm archlinux-keyring ; pacman -Syu"


# ▓▓▒░ net
                                                                        alias \
    ss="sudo ss"                                                              \
    netctl="sudo netctl"                                                      \
    openvpn="sudo openvpn"                                                    \
    iip="ip a s $(ip r | grep default | grep -oP '(?<=dev )[^ ]*')"           \
    failover="sudo ip link set enp5s0 down"                                   \
    failback="sudo ip link set enp5s0 up"


# ▓▓▒░ devops
                                                                        alias \
    ap="ansible-playbook"                                                     \
                                                                              \
    lxc-ls="lxc-ls -f"                                                        \
    lxls="lxc-ls -f"                                                          \
    lxst="lxc-start"                                                          \
    lxsp="lxc-stop"                                                           \
    lxat="lxc-attach"                                                         \
                                                                              \
    docker="sudo docker"                                                      \
    docker-compose="sudo docker-compose"                                      \
    dtail="docker logs -tf --tail='50'"                                       \
    dps="docker ps"                                                           \
    dpsa="docker ps -a"                                                       \
    dstart="docker start"                                                     \
    dstop="docker stop"                                                       \
    drm="docker rm"                                                           \
    drmi="docker rmi"                                                         \
    dcomp="docker-compose -f ./docker-compose.yml"                            \
                                                                              \
    tf="terraform"                                                            \
    tfi="terraform init"                                                      \
    tfa="terraform apply --auto-approve"                                      \
    tfp="terraform plan"                                                      \
    tfd="terraform destroy"                                                   \
                                                                              \
    kc="KUBECONFIG=./kubeconfig.yml kubectl"


# ▓▓▒░ recording

                                                                        alias \
    record="ffmpeg -f x11grab -s 1366x768 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y"

    # record the primary screen
    screencast() {
		test $1 && NAME=$1 || NAME="screencast"
        RESOLUTION=$(xrandr | grep "*" | awk '{print $1}' | head -n1)
        echo "recording to ${HOME}/lib/videos/recordings/screencasts/$(date +%Y%m%d)-${NAME}.webm"
        ffmpeg -f x11grab -s ${RESOLUTION} -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y ${HOME}/lib/videos/recordings/screencasts/$(date +%Y%m%d)-${NAME}.webm
    }

    # take picture with webcam
    webcapture() {
        NUM=$(ls -l $HOME/tmp/*webcapture*|wc -l)
        NUM=$(( NUM + 1 ))
        ffmpeg -f video4linux2 -s 640x480 -i /dev/video0 -ss 0:0:2 -frames 1 $HOME/tmp/$(date +%Y%m%d)-webcapture-${NUM}.png
    }


# ▓▓▒░ suffix
                                                                     alias -s \
    md=vim                                                                    \
    {png,jpg,jpeg}=sxiv                                                       \
    pdf=zathura                                                               \
    mp4=mpv


# ▓▓▒░ misc
                                                                        alias \
    mixer="alsamixer"                                                         \
    news="newsboat"                                                           \
    gifview="gifview -a"                                                      \
    mail="mutt -F ~/.mutt/muttrc-imap"                                        \
                                                                              \
    headsetbatt="bluetooth_battery 34:DF:2A:5F:04:2C"                         \
    headset="echo 'connect 34:DF:2A:5F:04:2C' | bluetoothctl"                 \
    bton="echo 'power on' | bluetoothctl"                                     \
    btoff="echo 'power off' | bluetoothctl"                                   \
                                                                              \
    nodisturb="dunstctl set-paused true"                                      \
    disturb="dunstctl set-paused false"                                       \
                                                                              \
    sacc="PAGER=less sacc"                                                    \
    gopher="PAGER=less sacc g.nixers.net/1/~pyratebeard/startpage.gph"        \
    buku="buku --np"                                                          \
    tin="NNTPSERVER=eu.newsdemon.com ~/src/warez/tin/tin-latest/src/tin -r -A"\
    drawterm="drawterm -h 9p.sdf.org -a 9p.sdf.org -u pyratebeard"            \
                                                                              \
    kb="keybase"                                                              \
    irc="mosh irclient -- ksh -c 'dtach -A /tmp/irc irssi'"                   \
    feh="feh -g 640x480"                                                      \
    rum.sh="nc rum.sh 9999"                                                   \
    moebius="cd $HOME/src/warez/moebius ; /usr/bin/npm start"                 \
    cointop="$HOME/src/go/bin/cointop --hide-statusbar"                       \
                                                                              \
    command -v gmake && make='gmake' # for openbsd


# ▓▓▒░ fun(ctions)

    email() {
      echo $3 | mutt -s $2 $1
    }

    # connect to tmux on ssh
    # host autocomplete - $HOME/.zsh/completion/_ssux
    ssux() {
        test $# -gt 0 && SYSTEM="$@" || SYSTEM=$(tmux list-windows | awk '/*/{print $2}' | tr -d '*')
        TERM=screen ssh -t "${SYSTEM}" 'tmux attach || tmux new' || ssh "${SYSTEM}"
    }

    # sets terminal title
    # useful for unhide (~/.interrobangrc:39)
    title() {
        printf "\033]2;${1}\007"
    }

    # read markdown files like manpages
    md() {
        pandoc -s -f markdown -t man "$*" | man -l -
    }

    # read webpage as manpage
    webman() {
        curl -L "$@" | pandoc -s -f html -t man | man -l -
    }

    # read anything as manpage
    nam() {
        pandoc -s -t man "$*" | man -l -
    }

    :q!() {
        [[ -v SSH_TTY ]] && echo dumpshock || sudo halt -p
    }
