echo '*** Create bashrc file ***'
echo export DOTPATH=`pwd` > bashrc_complied
cat bashrc >> bashrc_complied

echo '*** Create symbolic link of some dotfiles ***'

ln -s `pwd`/bashrc_complied $HOME/.bashrc
ln -s `pwd`/tmux.conf $HOME/.tmux.conf
ln -s `pwd`/vimrc $HOME/.vimrc


echo '*** Install thirdparty ***'
brew install reattach-to-user-namespace

echo -e $'\e[31m*** Notify for user action ***\e[m'
echo $'\e[33m1. Please import Iterm2 color (thirdparty/DarkSolarized.itermcolors)\e[m'
