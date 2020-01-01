#! /bin/sh
# vim dependent enviroment setuper

if ! type git > /dev/null; then
  echo git dosen\'t exist.
fi

ANYENV_ROOT = '$HOME/.anyenv/bin'

if ! [ -d "$ANYENV_ROOT" ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
fi

anyenv install pyenv

if ! type virtualenv > /dev/null; then
  git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi

git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git

pyenv install 3.5.6
pyenv virturlenv 3.5.6 neovim3

pyenv shell neovim3
pip install -U neovim pynvim cpplint

anyenv install ndenv

