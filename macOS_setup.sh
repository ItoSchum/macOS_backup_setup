#!/bin/bash

# Preparation
read -p "Enter the Source Username: " source_username
read -p "Enter the Source source_IP_address: " source_IP_address
echo "Confirmed"


# Install Apps

# 进入 iCloud 中的 AppList 文件夹
myPath=`~/Library/Mobile\ Documents/com\~apple\~CloudDocs/AppList`
cd $myPath
echo "current dir: $myPath" 

# 安装 Homebrew 和 MAS
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install mas

# 生成 MAS_AppList 安装命令
cat $myPath/MAS_AppList | sed "s/(.*)//g" | sed -Ee 's/([0-9]+) (.+)/mas install \1 #\2/g' > ~/Desktop/AppInstaller

# 生成 Brew_AppList 安装命令
echo "brew install $(cat ./Brew_AppList | tr '\n' ' ')" >> ~/Desktop/AppInstaller

# 生成 BrewCask_AppList 安装命令
echo "brew cask install $(cat ./BrewCask_AppList | tr '\n' ' ')" >> ~/Desktop/AppInstaller

# 开始安装
chmod +x ~/Desktop/AppInstaller
~/Desktop/AppInstaller


cd ~ 
echo "current dir `pwd`"

# bash

# Sync ~/.bash_profile 
rsync --progress $source_username@$source_IP_address:~/.bash_profile  ~/.bash_profile
source ~/.bash_profile


# zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Sync ~/.zshrc 
rsync --progress $source_username@$source_IP_address:~/.zshrc  ~/.zshrc

# THEME="honukai"
rsync -r --progress $source_username@$source_IP_address:~/.oh-my-zsh/themes/ ~/.oh-my-zsh/themes 

# zsh Plug-in (Need Manual)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

source ~/.zshrc

# vim
rsync --progress $source_username@$source_IP_address:~/.vimrc ~/.vimrc


# tmux

# Sync tmux plug-in Manager tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Sync tmux.conf
rsync --progress $source_username@$source_IP_address:~/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
### Manual OPs
### Prefix + I



# pyenv !!!

pyenv install $(cat AppList/pyenv | tr '\n' ' ') 
### Manual OPs
### pyenv install anaconda



# SSH

# Sync ~/.ssh/
rsync -r --progress $source_username@$source_IP_address:~/.ssh/  ~/.ssh



# Touch ID !!!

# Allow sudo Auth over Touch ID
# vim /etc/pam.d/sudo
# OR
# sudo nano /etc/pam.d/sudo

sed -i '2i auth sufficient pam_tid.so' /etc/pam.d/sudo


# Allow Any Developer 
sudo spctl --master-disable


# Install Preview Plug-in
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package quicklookase qlvideo



# aria2

# Make aria2c Config 
mkdir ~/.aria2
rsync --progress $source_username@$source_IP_address:~/.aria2/aria2.conf  ~/.aria2/aria2.conf

# Launch aria2c RPC Mode
# aria2c --conf-path="~/.aria2/aria2.conf" -D

# Stop aria2c RPC Mode
# ps -ef | grep aria2c
# kill PID_OF_aria2c



# Shadowsocks in CommandLine !!!

ln -sfv /usr/local/opt/polipo/*.plist ~/Library/LaunchAgents

###

cat > /usr/local/opt/polipo/homebrew.mxcl.polipo.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>homebrew.mxcl.polipo</string>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>ProgramArguments</key>
    <array>
      <string>/usr/local/opt/polipo/bin/polipo</string>
      <string>socksParentProxy=localhost:1086</string>
    </array>
    <!-- Set `ulimit -n 65536`. The default macOS limit is 256, that's
         not enough for Polipo (displays 'too many files open' errors).
         It seems like you have no reason to lower this limit
         (and unlikely will want to raise it). -->
    <key>SoftResourceLimits</key>
    <dict>
      <key>NumberOfFiles</key>
      <integer>65536</integer>
    </dict>
  </dict>
</plist>
EOF

#sed -i '13 <string>socksParentProxy=localhost:1086</string>' /usr/local/opt/polipo/homebrew.mxcl.polipo.plist

launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.polipo.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.polipo.plist




