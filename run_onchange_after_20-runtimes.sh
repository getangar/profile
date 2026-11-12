#!/bin/zsh
# Rieseguito quando cambi una versione qui sotto.
set -e
export PATH="$HOME/.rbenv/shims:$HOME/.pyenv/shims:/opt/homebrew/bin:$PATH"

rbenv install --skip-existing 3.4.12
rbenv global 3.4.12
gem install bundler

pyenv install --skip-existing 3.14.10
pyenv global 3.14.10
pyenv virtualenvs --bare | grep -qx learning || pyenv virtualenv 3.14.10 learning
