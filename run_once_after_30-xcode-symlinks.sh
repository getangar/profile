#!/bin/zsh
# Una sola volta per macchina. Chiede la password di sudo solo se mancano i link.
for tool in swiftlint swiftformat; do
  if [[ ! -L /usr/local/bin/$tool ]]; then
    sudo mkdir -p /usr/local/bin
    sudo ln -sf /opt/homebrew/bin/$tool /usr/local/bin/$tool
  fi
done
