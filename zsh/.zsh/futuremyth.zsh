# futuremyth
# tty colors
if [ "$TERM" = "linux" ]
then
    echo -en "\e]P0202224" #black
    echo -en "\e]P83d4047" #darkgrey
    echo -en "\e]P18d3636" #darkred
    echo -en "\e]P9813939" #red
    echo -en "\e]P276b660" #darkgreen
    echo -en "\e]PA629052" #green
    echo -en "\e]P3cd6e42" #yellow
    echo -en "\e]PBb36846" #orange
    echo -en "\e]P433708c" #darkblue
    echo -en "\e]PC32657c" #blue
    echo -en "\e]P5646086" #darkmagenta
    echo -en "\e]PD535071" #magenta
    echo -en "\e]P662a086" #darkcyan
    echo -en "\e]PE58929b" #cyan
    echo -en "\e]P7dceef1" #lightgrey
    echo -en "\e]PFbeced0" #white
    clear #for background artifacting
fi
