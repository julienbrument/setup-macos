#! /bin/sh


######
# Adapted from kangax's install.sh
######

###########
#
#    First, download & install XCode Dev Tools — https://developer.apple.com/downloads/
#
###########

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


echo "Checking for Homebrew..."
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# echo "Setting brew permissions..."
# chown -R $USER /usr/local/include
# chown -R $USER /usr/local/lib/pkgconfig

# Inspired by http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac

echo "Updating brew..."
brew update

echo "Installing GNU core utils (those that come with OS X are outdated)..."
brew install coreutils

echo "Installing more recent versions of some OS X tools..."
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# TODO add utils to zsh path

binaries=(
  ack
  cairo
  curl
  ffmpeg
  git
  git-extras
  grep
  imagemagick --with-webp
  node
  pkg-config
  redis
  mongodb
  tree
  unrar
  wget
  zopfli
)

echo "Installing binaries..."
brew install ${binaries[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing Cask..."
brew install caskroom/cask/brew-cask

echo "Adding nightly/beta Cask versions..."
brew tap caskroom/versions

# Apps
apps=(

  # work
  sublime-text
  virtualbox
  webstorm
  postman
  ngrok


  # productivity, core, runtimes
  cyberduck
  appcleaner
  osxfuse
  spectacle
  flash
  java
  quicklook-json
  docker-toolbox


  imageoptim

  istat-menus
  qlvideo # to display video files in finder and quick look
  trim-enabler
  timemachineeditor
  malwarebytes-anti-malware

  # sharing
  #dropbox
  #google-drive

  # browsers
  google-chrome
  firefox


  # communication
  skype
  slack

  # entertainment
  vlc


  # file sharing
  transmission
)

echo "Installing apps to /Applications..."
brew cask install --appdir="/Applications" ${apps[@]}


brew tap homebrew/fuse

echo "Installing other binaries that require Java, Fuse OS X, etc..."
post_binaries=(
  # elasticsearch
  ntfs-3g

)

brew install ${post_binaries[@]}

brew cask cleanup





echo "Generating SSH keys (https://help.github.com/articles/generating-ssh-keys)..."
ssh-keygen -t rsa -C "brument.julien@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub


open https://github.com/settings/ssh
open https://bitbucket.org/account/user/julienbrument/ssh-keys/

# echo "Customizing OSX..."
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# TODO: triggers for quicksilver



echo "Installing nvm..."
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash

echo "Installing global node packages..."
node_packages=(
  bower
  browserify
  caniuse-cmd
  grunt
  gulp
  htmlhint
  imageoptim-cli
  jshint
  jscs
  qunit
  watchify
)
npm install -g ${node_packages[@]}

echo "Customizing Sublime..."

#download and "install" Package Control
wget https://sublime.wbond.net/Package\ Control.sublime-package && mv Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages

# download and "install" Preferences file
# wget https://rawgit.com/kangax/osx/master/Preferences.sublime-settings && mv Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

# download and "install" Packages file
# wget https://rawgit.com/kangax/osx/master/Package\ Control.sublime-settings && mv Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
