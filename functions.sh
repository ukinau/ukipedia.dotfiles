section(){
  SECTION_NAME=$1
  echo "*** $SECTION_NAME ***"
}

section2nd(){
  SECTION_NAME=$1
  echo "  - $SECTION_NAME"
}

print_green () {
  echo -e "\033[0;32m $@ \033[0m"
}

print_red () {
  echo -e "\033[0;31m $@ \033[0m"
}

print_light_red () {
  echo -e "\033[1;31m $@ \033[0m"
}

create_symbolic () {
  ORIGINAL=$1
  TARGET=$2
  echo "  - create link from $ORIGINAL to $TARGET"
  if test -L $TARGET && \
     test $(ls -l $TARGET | awk '{print $11}') == $ORIGINAL; then
    print_green '   - already there'
  else
    if test -f $TARGET; then
      echo "   - rename $TARGET to ${TARGET}.old"
      mv ${TARGET} ${TARGET}.old
    fi
    ln -s $ORIGINAL $TARGET
  fi
}

brew_install () {
  _brew_install RAW $1 $2
}

brew_cask_install () {
  _brew_install CASK $1 $2
}

command_existing () {
  which $1 1>/dev/null 2>&1
}

_brew_install () {
  RAW_OR_CASK=$1
  PKG=$2
  AFTER=$3
  if test $RAW_OR_CASK == "RAW"; then
    LIST_CMD="list"
    INSTALL_CMD="install"
  else
    LIST_CMD="cask list"
    INSTALL_CMD="cask install"
  fi
  echo "  - $PKG"
  if test $(brew $LIST_CMD $PKG > /dev/null 2>&1; echo $?) -ne 1; then
    print_green '   - already installed'
  else
    brew $INSTALL_CMD $PKG
    if test $AFTER; then
      echo "   - execute after script"
      echo "    - $AFTER"
      eval $AFTER
    fi
  fi
}
