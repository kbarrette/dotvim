#!/bin/sh

# Set up Vundle
if [ ! -d "bundle/vundle" ]; then
  echo "Cloning Vundle"
  git clone https://github.com/gmarik/vundle.git bundle/vundle
fi

echo "Running BundleInstall"
vim +BundleInstall! +qall 2>/dev/null

echo "Done."

