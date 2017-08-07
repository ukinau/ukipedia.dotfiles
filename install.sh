set -e

REPO_PATH=$HOME/ukipedia.dotfiles
. $REPO_PATH/functions.sh


echo '*** cp etc/lib to /etc/lib ***'
cp -r etc/lib /etc; true

echo '*** Create bashrc file ***'
echo export DOTPATH=`pwd` > bashrc_complied
cat bashrc >> bashrc_complied

echo '*** Create symbolic link of some dotfiles ***'
create_symbolic $REPO_PATH/bashrc_complied $HOME/.bashrc
create_symbolic $REPO_PATH/tmux.conf $HOME/.tmux.conf
create_symbolic $REPO_PATH/vimrc $HOME/.vimrc


echo '*** Install thirdparty ***'
#brew install tmux <- my tmux.conf is not working for later than 2.4
brew_install openssl
echo '  - tmux 2.3'
if test $(which tmux1) -e ''; then
  sh tmux-install.sh
else
  print_green '   - already installed'
fi

echo '  - NeoBundleVIM'
if test -d ~/.vim/bundle/neobundle.vim; then
  print_green '   - already installed'
else
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > tmp_neobundlevim_install.sh
  sh tmp_neobundlevim_install.sh
  rm tmp_neobundlevim_install.sh
fi

brew_install reattach-to-user-namespace
brew_install bash-completion "brew tap homebrew/eompletions"
brew_install tig
brew_install golang

print_red '*** Notify for user action ***'
print_light_red ' - Please import Iterm2 color (thirdparty/DarkSolarized.itermcolors)'
