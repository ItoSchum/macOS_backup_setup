# macOS Backup & Setup

## Main Feature
- Backup your Mac's App List (Mac App Store & Brew & Brew Cask) to iCloud
- Set up a new Mac automatically from an old one.

## Requirement
1. Internet connection
2. Another Mac which is already configured and connected to the same LAN as your new Mac does.

## Usage
### Backup
- Backup Dir: `/User/[Username]/Library/Mobile\ Documents/com~apple~CloudDocs/AppList/All_AppList/`

- Backup Reference:
	- `All_AppList`: **All** the Apps in `/Applications`
	- `MAS_AppList`: Installed by **Mac App Store**
	- `Brew_AppList`: Installed by **Homebrew** (by `brew install`)
	- `BrewCask_AppList`: Installed by **Homebrew Cask** (by `brew cask install`)
	- `MAS_AppList_Brief`: `MAS_AppList`'s *Name-Only* list version
	- `nonMAS_AppList`: `All_AppList` subtract `MAS_AppList`

### Setup
> The Item with * indicates it's not certainly usable.

- **App Install**: Mac App Store, Homebrew, Homebrew Cask
- `Bash`: `~/.bash_profile`
- `Zsh`: `~/.zshrc`
- `Vim`: `~/.vimrc`
- `Tumx`*: `~/tmux.conf`, Plug-ins (Need additional manual OPs: `Prefix + I`)
- `Pyenv`*: Pyenv Applist Install
- `SSH`: `~/.ssh/`
- **Touch ID***: `/etc/pam.d/sudo` modification (Only suitable for Macs with Touch ID)
- **System Preference**: `sudo spctl --master-disable` to Allow Apps Downloaded from Anywhere
- **Preview Plug-in**:
	- qlcolorcode 
	- qlstephen 
	- qlmarkdown 
	- quicklook-json 
	- qlimagesize 
	- webpquicklook 
	- suspicious-package 
	- quicklookase 
	- qlvideo
- **Aria2**: `~/.aria2/aria2.conf`
- **Shadowsocks** Usage in Command Line* 

## Attention
- The script is mainly for personal usage, and some usage may be not completely usable.