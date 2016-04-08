export DOTPATH=/Users/ukinau/.ukipedia
export PATH=$PATH:$DOTPATH/bin
export ANSIBLE_NOCOWS=yes
if [ -z $TMUX ]; then
  if $(tmux has-session 2> /dev/null); then
    tmux -2 attach
  else
    tmux -2
  fi
fi
