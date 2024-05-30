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
# colours
red="\e[31m"
green="\e[32m"
reset="\e[0m"

# ▓▓▒░ root
# check for doas so aliases can be used on different systems
# add whitespace for hack to make aliases woth with {sudo,doas}
command -v doas >/dev/null && \
    alias sudo='doas ' || \
    alias sudo='sudo '

# ▓▓▒░ unix
# openbsd's ls(1) doesn't provide the `--color` option.
# i have grown to like this and spent a long time
# trying to find a work around, but none exists tiko.
# so i succumbed to installing coreutils and doing this
command -v gls >/dev/null && \
    alias ls="gls -hF --color=auto" || \
    alias ls="ls -hF --color=auto"

# i also need dircolors(1) from coreutils for zsh autocompletion
command -v gdircolors >/dev/null && alias dircolors="gdircolors"

# i make use of some funky shit in my log makefiles
# which isn't possible using the openbsd make(1)
command -v gmake >/dev/null && alias make='gmake'


# ▓▓▒░ sys
                                                                        alias \
    ll="ls -lahF --color=auto"                                                \
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
    history="history -i"                                                      \
    disks='echo "┌──┄";echo "├┄ m o u n t . p o i n t s"; echo "└──┄┄────┄┄"; lsblk -a; echo ""; echo "┌──┄";echo "├┄ d i s k . u s a g e"; echo "└──┄┄────┄┄"; sudo df -h -x tmpfs -x devtmpfs;' \
    ag="ag --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'" \
    tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'


# ▓▓▒░ almighty text editor
                                                                        alias \
    v="nvim"                                                                   \
    vi="nvim"                                                                  \
    emacs="nvim"


# ▓▓▒░ git
                                                                        alias \
    g="git"                                                                   \
    ga="git add"                                                              \
    gb="git branch"                                                           \
    gc="git commit -S -m"                                                     \
    gs="git status -sb"                                                       \
    gd="git diff"                                                             \
    gf="git fetch && git log --pretty=format:'%C(always,yellow)%h%Creset %s %Cred%d' ..@{u}" \
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
        git clone "${@}"
        test -n "${2}" && _dir=${2} || _dir=${1##*/}
        cd ${_dir%.git}
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
    # need ot find a better way to do this
    #iip="ip a s $(ip r | grep default | grep -oP '(?<=dev )[^ ]*')"           \
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
    md=nvim                                                                    \
    {png,jpg,jpeg}=sxiv                                                       \
    pdf=zathura                                                               \
    mp4=mpv


# ▓▓▒░ misc
                                                                        alias \
    mixer="alsamixer"                                                         \
    news="newsboat"                                                           \
    gifview="gifview -a"                                                      \
    lab="ssh pigley 'pcs'"                                                    \
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
    tin="NNTPSERVER=eu.newsdemon.com ~/.local/src/warez/tin/tin-latest/src/tin -r -A"\
    drawterm="drawterm -h 9p.sdf.org -a 9p.sdf.org -u pyratebeard"            \
                                                                              \
    kb="keybase"                                                              \
    irc="mosh irclient -- ksh -c 'dtach -A /tmp/irc irssi'"                   \
    feh="feh -g 640x480"                                                      \
    rum.sh="nc rum.sh 9999"                                                   \
    moebius="cd $HOME/.local/src/warez/moebius ; /usr/bin/npm start"                 \
    cointop="$HOME/.local/src/go/bin/cointop --hide-statusbar"

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

    mkcd() {
        mkdir -p "$1" && cd "$1"
    }

    labup() {
        /usr/bin/wol 00:23:24:b3:03:cb
        /usr/bin/wol 00:23:24:b5:75:61
    }

    labdown() {
        ssh pigley 'for r in $(pcs resource --hide-inactive | awk "{print \$2}") ; do pcs resource disable --wait $r ; done'
        for node in pigley goatley ; do
            ssh $node "systemctl poweroff"
        done
    }

    :q!() {
        [[ -v SSH_TTY ]] && echo dumpshock || {
            ping -q -c1 pigley >/dev/null 2>&1 && {
                echo -e "${red}lab still online${reset}"
                vared -p 'shutdown? [Y/n]: ' -c sdwn
                case ${sdwn} in
                    y|Y) labdown ;;
                    n) ;;
                    *) labdown ;;
                esac
            } || echo -e "${green}lab offline${reset}"
            rm -f /tmp/tmux.lock
            sudo halt -p
        }
    }
