# DOWNTIME
# tty colors
if [ "$TERM" = "linux" ]
then
    echo -en "\e]P0212021" #black
    echo -en "\e]P86b6573" #darkgrey
    echo -en "\e]P1e29e84" #darkred
    echo -en "\e]P9b8a3a7" #red
    echo -en "\e]P2b6ce63" #darkgreen
    echo -en "\e]PAb8d680" #green
    echo -en "\e]P3d4cd61" #yellow
    echo -en "\e]PBd3c284" #orange
    echo -en "\e]P48fbed3" #darkblue
    echo -en "\e]PC929eb5" #blue
    echo -en "\e]P5888aa9" #darkmagenta
    echo -en "\e]PD9c96ae" #magenta
    echo -en "\e]P6cfe063" #darkcyan
    echo -en "\e]PEdee773" #cyan
    echo -en "\e]P7fbf6f6" #lightgrey
    echo -en "\e]PFd4e4bf" #white
    clear #for background artifacting
fi
