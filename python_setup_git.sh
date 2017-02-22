#!/bin/bash

# PATHとかまとめて最初に定義
PYENV_URL=https://github.com/yyuu/pyenv.git
VENV_URL=https://github.com/yyuu/pyenv-virtualenv.git
PYENV_PATH=~/.pyenv
VENV_PATH=~/.pyenv/plugins/pyenv-virtualenv

echo
echo Hello!! This program is setup Python in your Mac!!

# gitはMacにデフォであるらしいが...確認大事
if [ -x "`which git `" ]; then
  echo "OK. git command exist."
else
  # 入ってなかったらbrewで入れたる.
  if [ -x "`which brew `" ]; then
    echo HomeBrew installed!! Nice!!
  else
    # これを機に入れちゃうぜ！！
    echo Not in HomeBrew!!
    echo "Install HomeBrew!!"
    bash ./brew_setup.sh
  fi

  # git入ってないからbrewで入れさせてもらう
  brew install git

  # 冗長だけどもっかい確認
  if [ -x "`which git `" ]; then
    echo "OK!! Installed Git!!"
  else
    # インストールできてなかったらbrewに問題ありそう
    echo "There seems to be errors such as brew."
    exit
  fi
fi

# HOMEにローカルにクローンするディレクトリを予め作成
mkdir $PYENV_PATH $VENV_PATH

# クローンする
git clone --recursive $PYENV_URL $PYENV_PATH
git clone --recursive $VENV_URL $VENV_PATH

# PATHの設定とか書き込んで適応させる
echo export PATH='/usr/local/bin:$PATH' >> ~/.bash_profile
echo 'export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
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
