#! /bin/sh


# Custom export user files
# Usage:
#
#  sh export.sh /path/to/export/
#

# Ask for the administrator password upfront
sudo -v

exportPath=$1
exportDirectoryName="osx_backup_$(date +"%m_%d_%Y")";

cd $exportPath
mkdir -p $exportDirectoryName
cd $exportDirectoryName

# Copy bash profile
echo "Export bash profile"
cp  ~/.bash_profile   .

# Copy keychain files
echo "Export macOS Keychains"

mkdir -p Keychains
cp  -r ~/Library/Keychains/*   Keychains/

# Copy SSH keys

echo "Export SSH keys"
mkdir -p SSHKeys
cp -r ~/.ssh/* SSHKeys/


# Copy SublimeText settings
echo "Export SublimeText settings"
mkdir -p SublimeSettings

cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings SublimeSettings/
cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings SublimeSettings/
