# KEYCHAIN

# ssh key dir
SSH_KEY_DIR="$HOME/.ssh"

GPG_TTY=$(tty)
export GPG_TTY

# funtoo keychain
eval $(keychain -q --agents gpg --nogui --eval 0xC7877C715113A16D)
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ] ; then
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
