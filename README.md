### Personal dotfiles and logs of installed packages.

Last update: February 2023.

---

#### Usage

To update symlinks, run from the current directory:

```
stow [ package name here ] -t ~/
```

This will symlink local dotfiles to the ones in this package.

Note that for remote servers, only `git`, `bash`, `vim`, `tmux` need too be stowed.

Homebrew usage is the following:

```
brew bundle dump # create list of installed packages
brew bundle      # install from brewfile
```

