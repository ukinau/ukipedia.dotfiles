create_symbolic () {
  ORIGINAL=$1
  TARGET=$2
  echo "  - create link from $ORIGINAL to $TARGET"
  if test -L $TARGET && \
     test $(ls -l $TARGET | awk '{print $11}') == $ORIGINAL; then
    echo '   - already there'
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
    echo '   - already installed'
  else
    brew install $PKG
    if test $AFTER; then
      echo "   - execute after script"
      echo "    - $AFTER"
      eval $AFTER
    fi
  fi
}
