# ░▀▀█░█▀▀░█░█░░
# ░▄▀░░▀▀█░█▀█░░
# ░▀▀▀░▀▀▀░▀░▀░░

# set hostname
HOSTNAME=$(hostnamectl hostname | awk -F. '{print $1}')

# load configs
for config (~/.config/zsh/*.zsh) source $config
setopt auto_cd

export PATH=$PATH:/home/pyratebeard/bin:/home/pyratebeard/.local/bin

source ~/.config/zsh/downtime.zsh
