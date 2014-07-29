# dotfiles

## dotfiles/

All files/directories ($f) in the dotfiles folder will be copied to
~/.$f

## pins file

the pins file contains entries with 2 columns, separated by a ` `
whitespace character. The first columns refers to the file in ```install.d```
the second to a git tag or branch. You can use it to pin the installed software
to a fixed version. You can request the pin with the ```pins $name``` function,
e.g.

```
git checkout $(pin node)
```

## install.d/*

create a shell script in install.d with 2 functions:

- depends(): echo debian packages to be installed (e.g. ```echo "git curl"```)
- install(): install the software, do whatever is needed
