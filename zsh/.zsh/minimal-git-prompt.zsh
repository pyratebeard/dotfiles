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
setopt PROMPT_SUBST
#???? colors for permissions
if [[ "$EUID" -ne "0" ]]
then  # if user is not root
  USER_LEVEL="${COLOR_USER}"
else # root!
  USER_LEVEL="${COLOR_ROOT}"
fi

GIT_PROMPT() {
  test=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ ! "$test" ]
  then
    case "$PROMPT_STYLE" in
      ascii)
        echo "$reset_color%F{cyan}??"
      ;;
      arrows)
        echo "$reset_color%F{cyan}?"
      ;;
    esac
    return
  fi
  ref=$(git name-rev --name-only HEAD | sed 's!remotes/!!' 2> /dev/null)
  dirty="" && [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] &&     dirty=$ICO_DIRTY
  stat=$(git status | sed -n 2p)
  case "$stat" in
    *ahead*)
      stat=$ICO_AHEAD
    ;;
    *behind*)
      stat=$ICO_BEHIND
    ;;
    *diverged*)
      stat=$ICO_DIVERGED
    ;;
    *)
      stat=""
    ;;
  esac
  echo "${USER_LEVEL}[${COLOR_NORMAL}"${ref}${dirty}${stat}"${USER_LEVEL}] "
}
# Minimal prompt
PROMPT='%F{cyan}${USERNAME}@%F{white}[archee] $(GIT_PROMPT): %~# '
