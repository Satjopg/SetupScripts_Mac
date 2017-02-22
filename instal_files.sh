#!/usr/bin/env bash

# PATH, URLの定義
SETUP_PATH=~/SetupScripts_Mac
tarball=https://github.com/Satjopg/SetupScripts_Mac/archive/master.tar.gz
GITHUB_URL=https://github.com/Satjopg/SetupScripts_Mac.git

# インストール先を作っておく
mkdir $SETUP_PATH

# git見てるから多分ある
if [ -x "'which git'" ]; then
  git clone --recursive $GITHUB_URL $SETUP_PATH
else
  # 安全策としてcurlでいけるようにしとく
  cd
  curl -L $tarball | tar xv -
  cd ~/SetupScripts_Mac-master

  # すべてのファイルを移動
  for file in `\find . -maxdepth 1 -type f`;
  do
    mv -f $file $SETUP_PATH
  done

  echo "file move done!!"

  # tarballディレクトリはいらないから消す
  cd ../ | rm -rf ~/SetupScripts_Mac-master
fi
