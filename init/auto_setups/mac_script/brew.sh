#!/bin/bash

function command_exists {
  command -v "$1" > /dev/null;
}

if ! command_exists brew ; then
  echo " --------- Homebrew ----------"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew upgrade --all --cleanup
  brew -v
  echo " ------------ END ------------"
fi

if ! command_exists git ; then
  echo " ------------ Git ------------"
  brew install git
  git --version
  echo " ------------ END ------------"
fi

if ! command_exists mas; then
   echo " ----------- mas ------------"
   brew install mas
fi

echo " ----------- X code ------------"
mas install 497799835
sudo xcodebuild -license accept
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

echo " -------- brew insatalls -------"
brew install rcmdnk/file/brew-file
brew file install
echo " ----------- end ---------------"

chsh -s /usr/local/bin/fish

curl https://sh.rustup.rs -sSf | sudo sh
rustup component add rust-src

if ! command_exists rbenv ; then
  echo " ----------- Ruby ------------"
  brew install rbenv
  brew install ruby-build
  rbenv --version
  rbenv install -l
  ruby_latest=$(rbenv install -l | grep -v '[a-z]' | tail -1 | sed 's/ //g')
  rbenv install $ruby_latest
  rbenv global $ruby_latest
  rbenv rehash
  ruby -v
  echo " ------------ END ------------"
fi

if ! command_exists nodebrew ; then
  echo " ---------- Node.js ----------"
  curl -L git.io/nodebrew | perl - setup
  nodebrew ls-remote
  nodebrew install-binary latest
  nodebrew ls
  nodebrew use latest
  echo " ------------ END ------------"
fi

echo " ----install font install ---"
wget https://github.com/yuru7/HackGen/releases/download/v1.0.0/HackGen_v1.0.0.zip
mv ./ttf/* ~/Library/Fonts
rm -fr ttf
rm Hack-v3.003-ttf.zip -fr
echo " -------- END -------------"
