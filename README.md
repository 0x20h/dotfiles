dotfiles
========

My most important config files (tmux, vim, ...).

Installation
------------

1. Clone the repo. `git clone https://github.com/0x20h/dotfiles.git`.
2. `cd dotfiles`
3. create a private-vimrc if you wish to have additional settings (will be appended to .vimrc)
4. `./install` copies the relevant files to your user directory.

.bashrc
-------

To support colors in less and vim etc. put in your .bashrc:

```bash
alias tmux='TERM=xterm-256color; tmux -2'
TERM=screen-256color
```
