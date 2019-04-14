# KEYCHAIN

# ssh key dir
SSH_KEY_DIR="$HOME/.ssh"

# funtoo keychain
eval $(keychain -q --agents ssh,gpg --nogui --eval $SSH_KEY_DIR/*.prv 0xC7877C715113A16D)

GPG_TTY=$(tty)
export GPG_TTY
