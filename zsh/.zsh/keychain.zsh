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
# SSH keys
export SSH_KEY_PATH="~/.ssh/id_rsa"

# funtoo keychain
eval `keychain -q --eval ~/.ssh/id_rsa`
