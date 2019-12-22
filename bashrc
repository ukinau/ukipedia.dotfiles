source ~/ukipedia.dotfiles/thirdparty/git/git-prompt.sh
source ~/ukipedia.dotfiles/thirdparty/git/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

export PATH=$PATH:$DOTPATH/bin:$HOME/bin
export ANSIBLE_NOCOWS=yes

alias tmux="cd ~/.tmuxlogs && tmux"

if ! test -d ~/.tmuxlogs; then
  mkdir ~/.tmuxlogs
fi

if [ -z $TMUX ]; then
  if $(tmux has-session 2> /dev/null); then
    tmux -2 attach
  else
    tmux -2
  fi
fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
