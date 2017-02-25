#! /bin/sh


# Custom import user files
# Usage:
#
#  sh import.sh /path/to/dumps/a-dated-dump
#


# Ask for the administrator password upfront
sudo -v

cd $1

echo "Import bash profile"
cp .bash_profile ~/


echo "Import Keychains"
cp -r Keychains/* ~/Library/Keychains/



echo "Import SSH keys"
mkdir -p ~/.ssh/
cp -r  SSHKeys/* ~/.ssh/


##echo "Import SublimeText settings"
##
##cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings SublimeSettings/
##cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings SublimeSettings/
