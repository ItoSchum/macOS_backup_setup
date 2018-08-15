#!/bin/bash

# Preparation
# myPath=`pwd`
# cd $myPath
# echo $myPath

# Create AppList Folder
mkdir ~/Library/Mobile\ Documents/com~apple~CloudDocs/AppList

# All Apps
ls -1 /Applications | sed 's/\.app//g' > ~/Library/Mobile\ Documents/com~apple~CloudDocs/AppList/All_AppList
# ls -lh /Applications | sed 's/\.app//g' 

# MAS Apps
/usr/local/bin/mas list > ~/Library/Mobile\ Documents/com~apple~CloudDocs/AppList/MAS_AppList

# brew Apps
/usr/local/bin/brew leaves > ~/Library/Mobile\ Documents/com~apple~CloudDocs/AppList/Brew_AppList

# brew cask Apps
/usr/local/bin/brew cask list > ~/Library/Mobile\ Documents/com~apple~CloudDocs/AppList/BrewCask_AppList

# nonMAS Apps
/usr/local/bin/mas list | cut -d " " -f 2  > ~/Library/Mobile\ Documents/com~apple~CloudDocs/AppList/MAS_AppList_Brief
comm -23 /Users/itoshen/Library/Mobile\ Documents/com~apple~CloudDocs/AppList/All_AppList /Users/itoshen/Library/Mobile\ Documents/com~apple~CloudDocs/AppList/MAS_AppList_Brief > /Users/itoshen/Library/Mobile\ Documents/com~apple~CloudDocs/AppList/nonMAS_AppList