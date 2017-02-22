#!/bin/bash

# Homebrewのダウンロード先のURL
Brew_URL=https://raw.githubusercontent.com/Homebrew/install/master/install

echo
echo "This program is setup HomeBrew is pacckage manager for Mac!!"

# 一応入ってないか確認
if [ -x "'which brew'"]; then
  echo "Homebrew exists in your device!!"
  echo "See you."
  exit
else
  echo "Install HomeBrew!!"
  ruby -e "$(curl -fsSL $Brew_URL)"

  # brewのインストール先のPATHを通す(クソ大事)
  echo export PATH='/usr/local/bin:$PATH' >> ~/.bash_profile
  source ~/.bash_profile
  brew update
  brew doctor

  # コマンドが動いているでインストールされたかを判断
  if [ $? = 0 ]; then
    echo "OK. HomeBrew is installed!!"
  else
    echo "Install Failed..."
  fi
fi
