## set command prediction from history, see 'man 1 zshcontrib'
is4 && zrcautoload predict-on && \
zle -N predict-on         && \
zle -N predict-off        && \
bindkey "^X^Z" predict-on && \
bindkey "^Z" predict-off

## some popular options ##

## add `|' to output redirections in the history
setopt histallowclobber

## try to avoid the 'zsh: no matches found...'
setopt nonomatch

## warning if file exists ('cat /dev/null > ~/.zshrc')
setopt NO_clobber

## alert me if something failed
setopt printexitvalue

## if a new command line being added to the history list duplicates an older
## one, the older command is removed from the list
is4 && setopt histignorealldups

## compsys related snippets ##
mkdir -p $XDG_CACHE_HOME/zsh
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
## to have more convenient account completion, specify your logins:
#my_accounts=(
# {grml,grml1}@foo.invalid
# grml-devel@bar.invalid
#)
#other_accounts=(
# {fred,root}@foo.invalid
# vera@bar.invalid
#)
#zstyle ':completion:*:my-accounts' users-hosts $my_accounts
#zstyle ':completion:*:other-accounts' users-hosts $other_accounts

## aliases ##

alias dots='yadm'
alias cd='z'

## global aliases (for those who like them) ##

#alias -g '...'='../..'
#alias -g '....'='../../..'
#alias -g BG='& exit'
#alias -g C='|wc -l'
#alias -g G='|grep'
#alias -g H='|head'
#alias -g Hl=' --help |& less -r'
#alias -g K='|keep'
#alias -g L='|less'
#alias -g LL='|& less -r'
#alias -g M='|most'
#alias -g N='&>/dev/null'
#alias -g R='| tr A-z N-za-m'
#alias -g SL='| sort | less'
#alias -g S='| sort'
#alias -g T='|tail'
#alias -g V='| vim -'

## Download a file and display it locally
#uopen() {
#    emulate -L zsh
#    if ! [[ -n "$1" ]] ; then
#        print "Usage: uopen \$URL/\$file">&2
#        return 1
#    else
#        FILE=$1
#        MIME=$(curl --head $FILE | \
#               grep Content-Type | \
#               cut -d ' ' -f 2 | \
#               cut -d\; -f 1)
#        MIME=${MIME%$'\r'}
#        curl $FILE | see ${MIME}:-
#    fi
#}

## log out? set timeout in seconds...
## ...and do not log out in some specific terminals:
#if [[ "${TERM}" == ([Exa]term*|rxvt|dtterm|screen*) ]] ; then
#    unset TMOUT
#else
#    TMOUT=1800
#fi

## ctrl-s will no longer freeze the terminal.
stty erase "^?"

## END OF FILE #################################################################
function dprune () {
  green="`tput setaf 2`"
  normal="`tput sgr0`"

  echo -e 'Stopping containers... \c'
  docker stop `docker ps -aq` &> /dev/null || true
  echo "${green}done${normal}"

  echo -e 'Pruning containers... \c'
  docker rm `docker ps -aq` &> /dev/null || true
  echo "${green}done${normal}"

  echo -e 'Pruning volumes... \c'
  docker volume rm `docker volume ls` &> /dev/null || true
  echo "${green}done${normal}"

  echo -e 'Pruning dangling images... \c'
  docker rmi `docker images -f 'dangling=true' -q` &> /dev/null || true
  echo "${green}done${normal}"
}

export EDITOR=micro
export NPM_TOKEN="$(grep -s //registry.npmjs.org/:_authToken= $NPM_CONFIG_USERCONFIG | cut -c34- )"
export PATH="$HOME/.local/bin:$HOME/.local/share/cargo/bin:$PATH"
export FLYCTL_INSTALL="/home/mpaupulaire/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
source /usr/share/nvm/init-nvm.sh
source $XDG_CONFIG_HOME/zsh/zsh.env.local

eval "$(zoxide init zsh)"
# eval "$(zellij setup --generate-auto-start zsh)"
