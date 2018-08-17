# macOS Backup & Setup

## Main Feature
- Backup your Mac's App List (Mac App Store & Brew & Brew Cask) to iCloud
- Set up a new Mac automatically from an old one.

## Requirement
### For Backup
- No particular requirement.

### For Setup
1. Internet connection
2. Another Mac which is already configured and connected to the same LAN as your new Mac does.

## Usage
### For Backup
- **Tutorial:** 
	- Just run the Script, and it will back up App list automatically.

- **Reference:**
	- Backup Dir: `/User/[Username]/Library/Mobile\ Documents/com~apple~CloudDocs/AppList/All_AppList/`

	- Backup Reference:
		- `All_AppList`: **All** the Apps in `/Applications`
		- `MAS_AppList`: Installed by **Mac App Store**
		- `Brew_AppList`: Installed by **Homebrew** (by `brew install`)
		- `BrewCask_AppList`: Installed by **Homebrew Cask** (by `brew cask install`)
		- `MAS_AppList_Brief`: `MAS_AppList`'s *Name-Only* list version
		- `nonMAS_AppList`: `All_AppList` subtract `MAS_AppList`

### For Setup
> About The Item with * indicates: It's not certainly usable.

> About Mac App Store App Installation: If you once use multiple Apple ID accounts in Mac App Store, it will only back up one particular account's downloads.

- **Tutorial:**
	1. `Enter the Source Username:` Displayed: Input the `[source_username]` of the old Mac.  
	2. `Enter the Source source_IP_address:` Displayed: Input the `[source-_IP_address]` of the old Mac which should have connected to the same LAN as your new Mac does.  
	3. `Confirmed` Displayed: The script will finish the rest tasks automatically.

- **Reference:**
	- **App Install**: Mac App Store, Homebrew, Homebrew Cask
	- **`Bash`:** `~/.bash_profile`
	- **`Zsh`:** `~/.zshrc`
	- **`Vim`:** `~/.vimrc`
	- **`Tumx`*****:** `~/tmux.conf`, Plug-ins (Need additional manual OPs: `Prefix + I`)
	- **`Pyenv`*****:** Pyenv Applist Install
	- **`SSH`:** `~/.ssh/`
	- **Touch ID** * **:** `/etc/pam.d/sudo` modification (Only suitable for Macs with Touch ID)
	- **System Preference:** `sudo spctl --master-disable` to Allow Apps Downloaded from Anywhere
	- **Preview Plug-In:**
		- qlcolorcode 
		- qlstephen 
		- qlmarkdown 
		- quicklook-json 
		- qlimagesize 
		- webpquicklook 
		- suspicious-package 
		- quicklookase 
		- qlvideo
	- **Aria2:** `~/.aria2/aria2.conf`
	- **Shadowsocks** Usage in Command Line* 

## Attention
- The script is mainly for personal usage, and some usage may be not completely usable.