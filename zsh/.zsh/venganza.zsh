# VENGANZA
# tty colors
if [ "$TERM" = "linux" ]
then
    echo -en "\e]P0212121" #black
    echo -en "\e]P83e3c3a" #darkgrey
    echo -en "\e]P1c73d2f" #darkred
    echo -en "\e]P9923a45" #red
    echo -en "\e]P21dc189" #darkgreen
    echo -en "\e]PA2a936b" #green
    echo -en "\e]P3a0ac6b" #yellow
    echo -en "\e]PB997358" #orange
    echo -en "\e]P43a7885" #darkblue
    echo -en "\e]PC366696" #blue
    echo -en "\e]P5776e89" #darkmagenta
    echo -en "\e]PD4f5090" #magenta
    echo -en "\e]P635abbb" #darkcyan
    echo -en "\e]PE5a7588" #cyan
    echo -en "\e]P7e6e3c6" #lightgrey
    echo -en "\e]PFeeeeec" #white
    clear #for background artifacting
fi
