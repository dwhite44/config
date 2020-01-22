# Configuration Files
Intended to use symlinks to the various files and directories

### iTerm2 Settings
com.googlecode.iterm2.plist

Export/Import Settings:
Preferences / General
* Load preferences from a custom folder or Url
* Browse to this directory
* Save Current Settings to Folder to save

### Zsh Settings
### Setup configuration directory

Requires:
* zsh installed
* ZDOTDIR to be set in .zshenv (to zsh directory)
* Set which modules to use in .zshenv

```
ZDOTDIR=$HOME/config/zsh

export HAS_GIT=true
# export HAS_ADB=true
export HAS_BREW=true
export HAS_BREW_CURL=true
export HAS_CCAT=true
export HAS_DIRENV=true
# export HAS_RBENV=true
export HAS_ZSH_SYNTAX_HIGHLIGHTING=true
```

### Emacs Config
* Install Emacs
* Create symbolic link for .emacs.d to emacs directory
```
ln -s ~/config/emacs ~/.emacs.d
```