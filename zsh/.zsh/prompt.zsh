#ICO_DIRTY="⚡"
#ICO_DIRTY="↯"
ICO_DIRTY="*"
#ICO_AHEAD="↑"
ICO_AHEAD="🠙"
#ICO_AHEAD="▲"
#ICO_BEHIND="↓"
ICO_BEHIND="🠛"
#ICO_BEHIND="▼"
ICO_DIVERGED="⥮"
COLOR_ROOT="%F{red}"
COLOR_USER="%F{cyan}"
COLOR_NORMAL="%F{white}"
PROMPT_STYLE="tiny"

#█▓▒░ allow functions in the prompt
setopt PROMPT_SUBST
autoload -Uz colors && colors

#█▓▒░ autoload zsh functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

#█▓▒░ enable auto-execution of functions
typeset -ga chpwd_functions

#█▓▒░ prepend functions
chpwd_functions+=('chpwd_auto_cd')

#█▓▒░ colors for permissions
if [[ "$EUID" -ne "0" ]]
then  # if user is not root
	USER_LEVEL="${COLOR_USER}"
else # root!
	USER_LEVEL="${COLOR_ROOT}"
fi

#█▓▒░ git prompt
GIT_PROMPT() {
  test=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ ! "$test" ]
  then
    case "$PROMPT_STYLE" in
      ascii)
        echo "$reset_color%F{cyan}▒░"
      ;;
      arrows)
        echo "$reset_color%F{cyan}"
      ;;
    esac
    return
  fi
  ref=$(git name-rev --name-only HEAD | sed 's!remotes/!!' 2> /dev/null)
  dirty="" && [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && dirty=$ICO_DIRTY
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
  case "$PROMPT_STYLE" in
    classic)
      echo "${COLOR_NORMAL}─["${ref}${dirty}${stat}"]"
    ;;
    tiny)
      echo "${COLOR_NORMAL} ["${ref}${dirty}${stat}"]"
    ;;
    *)
      echo "${USER_LEVEL}─[${COLOR_NORMAL}"${ref}${dirty}${stat}"${USER_LEVEL}]"
    ;;
  esac
}
case "$PROMPT_STYLE" in
# ascii
ascii)
PROMPT='%{$bg[cyan]%} %F{black}%~ $(GIT_PROMPT)$reset_color 
%f'
;;
# dual line
dual)
PROMPT='${USER_LEVEL}┌[${COLOR_NORMAL}%~${USER_LEVEL}]$(GIT_PROMPT)
${USER_LEVEL}└─ - %f'
;;
# mini
mini)
PROMPT='${USER_LEVEL}[${COLOR_NORMAL}%~${USER_LEVEL}]$(GIT_PROMPT)── - %f'
;;
# tiny
tiny)
PROMPT='${COLOR_NORMAL} % : '
RPROMPT='%~ $(GIT_PROMPT)'
;;
# classic
*)
PROMPT='%F{blue}${USERNAME}@%F{white}[${HOSTNAME}]$(GIT_PROMPT)%F{white} : %~# '
;;
esac
