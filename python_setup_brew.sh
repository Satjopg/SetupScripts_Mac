#!/bin/bash

echo
echo "Hello!! This program is setup Python in your Mac!!"

# brewコマンド使えますかーーー!?!?って感じ
if [ -x "`which brew `" ]; then
  echo "OK!! Installed HomeBrew!!"
else
  echo "HomeBrew Insatll."
  bash ./brew_setup.sh
fi

# pyenvとvirtualenvをインストール
brew update
brew install pyenv
brew install pyenv-virtualenv

# 変換内容を追記して, 再読込.
echo 'eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
source ~/.bash_profile

# pyenvのPATH確認
if [ -x "`which pyenv `" ]; then
  echo "OK, pyenv installed!!"
else
  echo "Sorry, Please confirm PATH."
  exit
fi

# ダウンロードしたいPythonのバージョンを入力させる
echo "Please enter Python Version you want to use"
echo "ex:3.3.3"
read Python_Version

echo "OK. Python$Python_Version install."

# pyenv使ってインストール
pyenv install $Python_Version
pyenv global $Python_Version
pyenv versions

echo "Success Python install!!"
echo "Usage enter pyenv to terminal!!"
