# My emacs settings

## Setup

To grab all the dependencies:

    git clone --recursive git://github.com/magnars/.emacs.d.git

The first time you start emacs, it will install some additional packages
that are best handled by the package manager.

## Install emacs on mac

I use Cocoa Emacs, installed like this:

    brew install emacs --cocoa

To open it with Alfred or Quicksilver, you have to copy `Emacs.app` into
`/Applications` instead of the symlink that brew places there.

