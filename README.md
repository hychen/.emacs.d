# My emacs settings

## Setup

To grab all the dependencies:

    git clone --recursive git://github.com/hychen/.emacs.d.git

The first time you start emacs, it will install some additional packages
that are best handled by the package manager.

## Install emacs on mac

I use Cocoa Emacs, installed like this:

    brew install emacs --cocoa

## Survival guide for the first week of emacs

When you start using emacs for the first time, your habits fight you every inch
of the way. Your fingers long for the good old familiar keybindings. Here's an
overview of the most commonly used shortcuts to get you through this pain:

* `C      ` Shorthand for the ctrl-key
* `M      ` Shorthand for the meta-key (bound to cmd on my mac settings)
* `S      ` Shorthand for the shift-key

### Files

* `C-x C-f` Open a file. Starts in the current directory
* `C-x f  ` Open a recently visited file
* `C-x o  ` Open a file in the current project (based on .git ++)
* `C-x C-s` Save this file
* `C-x C-w` Save as ...
* `C-x C-j` Jump to this files' current directory
* `C-x b  ` Switch to another open file (buffer)
* `C-x C-b` List all open files (buffers)

### Cut copy and paste

* `C-space` Start marking stuff. C-g to cancel.
* `C-w    ` Cut (aka kill)
* `C-k    ` Cut till end of line
* `M-w    ` Copy
* `C-y    ` Paste (aka yank)
* `M-y    ` Cycle last paste through previous kills
* `C-x C-y` Choose what to paste from previous kills
* `C-@    ` Mark stuff quickly. Press multiple times

### General

* `C-g    ` Quit out of whatever mess you've gotten yourself into
* `M-x    ` Run a command by name

### Navigation

* `C-arrow` Move past words/paragraphs
* `C-a    ` Go to start of line
* `C-e    ` Go to end of line
* `M-g M-g` Go to line number
* `C-x C-i` Go to symbol
* `C-s    ` Search forward. Press `C-s` again to go further.
* `C-r    ` Search backward. Press `C-r` again to go further.
* `C-x C-b` Switch buffers interactively (ibuffer)
* `C-x b`   Switching buffers interactively (ido)

## Window management

- `C-x 0`  Close this window
- `C-x 1`  Close other windows
- `C-x 2`  Split window horizontally
- `C-x 3`  Split window vertically
- `C-x |`  Split window horizontally instead
- `C-x _`  Split window vertically instead
- `C-c ->` Switch to right window
- `C-c <-` Switch to left window
- `Alt N`  Switch to N window

## Notes management
- `F12` Switch to the notes directory (default: `~/Dropbox/Org/Notes`)

## Verson Control
- `C-x g` - Magit

## Help

- `F1 t` Basic tutorial
- `F1 k` Help for a keybinding
- `F1 r` Emacs' extensive documentation
