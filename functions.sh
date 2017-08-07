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
  PKG=$1
  AFTER=$2
  echo "  - $PKG"
  if test $(brew list $PKG > /dev/null 2>&1; echo $?) -ne 1; then
    print_green '   - already installed'
  else
    brew install $PKG
    if test $AFTER; then
      echo "   - execute after script"
      echo "    - $AFTER"
      eval $AFTER
    fi
  fi
}
