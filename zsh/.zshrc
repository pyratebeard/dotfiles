# '########::'######::'##::::'##:
# ..... ##::'##... ##: ##:::: ##:
# :::: ##::: ##:::..:: ##:::: ##:
# ::: ##::::. ######:: #########:
# :: ##::::::..... ##: ##.... ##:
# : ##::::::'##::: ##: ##:::: ##:
#  ########:. ######:: ##:::: ##:
# ........:::......:::..:::::..::
#
# AUTHOR  pyratebeard <root@pyratebeard.net>
# CODE    http://github.com/pyratebeard/dotfiles
#
# Load configs
for config (~/.zsh/*.zsh) source $config
setopt auto_cd
export PATH="$HOME/.dynamic-colors/bin:$PATH"
source $HOME/.dynamic-colors/completions/dynamic-colors.zsh
