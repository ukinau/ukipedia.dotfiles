set -e

REPO_PATH=$HOME/ukipedia.dotfiles
. $REPO_PATH/functions.sh


section 'cp etc/lib to /etc/lib'
{
  sudo cp -r etc/lib /etc; true
}

section 'Create bashrc file'
{
  echo export DOTPATH=`pwd` > bashrc_complied
  cat bashrc >> bashrc_complied
}

section 'Create symbolic link of some dotfiles'
{
  create_symbolic $REPO_PATH/bashrc_complied $HOME/.bashrc
  create_symbolic $REPO_PATH/tmux.conf $HOME/.tmux.conf
  create_symbolic $REPO_PATH/vimrc $HOME/.vimrc
}

section 'mkdir -p $HOME/.tmux/log'
{
  if ! [ -d $HOME/.tmux/log ]; then
    mkdir -p $HOME/.tmux/log
  else
    print_green '  - already exist'
  fi
}

section 'Install thirdparty'
{
  #install pip
  echo '  - pip'
  if which pip 1>/dev/null 2>&1; then
    print_green '   - already installed'
  else
    curl -O https://bootstrap.pypa.io/get-pip.py
    sudo python get-pip.py
  fi
  #brew install tmux <- my tmux.conf is not working for later than 2.4
  brew_install openssl
  echo '  - tmux 2.3'
  if which tmux 1>/dev/null 2>&1; then
    print_green '   - already installed'
  else
    sh tmux-install.sh
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
  brew_cask_install virtualbox
  brew_cask_install vagrant
}

print_red '*** Notify for user action ***'
print_light_red ' - Please import Iterm2 color (thirdparty/DarkSolarized.itermcolors)'
