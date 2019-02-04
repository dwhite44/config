# Configuration Files
Intended to use symlinks to the various files and directories

### iTerm2 Settings
com.googlecode.iterm2.plist

Export/Import Settings:
Preferences / General
* Load preferences from a custom folder or Url
* Browse to this directory
* SAve Current Settings to Folder to save

### Zsh Settings
### Setup configuration directory

Requires:
* zsh installed
* antigen installed
  * Mac: brew install antigen
  * CentOs: curl -L git.io/antigen > antigen.zsh > /opt/bin/antigen.zsh
* ANTIGEN_PATH to be set in .zshenv (to antigen.zsh)
* ZDOTDIR to be set in .zshenv (to zsh directory)

```
ANTIGEN_PATH=/usr/local/share/antigen/antigen.zsh
ZDOTDIR=$HOME/config/zsh
```
