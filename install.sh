set -e

echo '*** cp etc/lib to /etc/lib ***'
cp -r etc/lib /etc; true

echo '*** Create bashrc file ***'
echo export DOTPATH=`pwd` > bashrc_complied
cat bashrc >> bashrc_complied

echo '*** Create symbolic link of some dotfiles ***'

ln -s `pwd`/bashrc_complied $HOME/.bashrc || true
ln -s `pwd`/tmux.conf $HOME/.tmux.conf || true
ln -s `pwd`/vimrc $HOME/.vimrc || true


echo '*** Install thirdparty ***'
#brew install tmux <- my tmux.conf is not working for later than 2.4
echo '  - tmux 2.3'
if test $(which tmux1) -e ''; then
  brew install openssl
  sh tmux-install.sh
  brew install reattach-to-user-namespace
else
  echo '   - already installed'
fi

echo '  - NeoBundleVIM'
if test -d ~/.vim/bundle/neobundle.vim; then
  echo '   - already installed'
else
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > tmp_neobundlevim_install.sh
  sh tmp_neobundlevim_install.sh
  rm tmp_neobundlevim_install.sh
fi

echo '  - bash-completion'
if test -f $(brew --prefix)/etc/bash_completion; then
  echo '   - already installed'
else
  brew install bash-completion
  brew tap homebrew/completions
fi

echo '  - tig'
if test $(brew list tig > /dev/null; echo $?) -ne 1; then
  echo '   - already installed'
else
  brew install tig
fi


echo -e $'\e[31m*** Notify for user action ***\e[m'
echo $'\e[33m1. Please import Iterm2 color (thirdparty/DarkSolarized.itermcolors)\e[m'
