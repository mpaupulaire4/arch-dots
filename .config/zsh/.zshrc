## set command prediction from history, see 'man 1 zshcontrib'
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
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

# export NPM_TOKEN="$(grep -s //registry.npmjs.org/:_authToken= $NPM_CONFIG_USERCONFIG | cut -c34- )"
source /usr/share/nvm/init-nvm.sh
source $XDG_CONFIG_HOME/zsh/zsh.env.local

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
# eval "$(zellij setup --generate-auto-start zsh)"
