#!/bin/bash
set -Ceux

# install basic packages
sudo apt update -qq
sudo apt install -y \
  build-essential \
  curl \
  git \
  jq \
  keychain \
  fzf \
  bat

# enhancd
git clone https://github.com/babarot/enhancd ~/enhancd && source ~/enhancd/init.sh

# install micro editor
curl https://getmic.ro | bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install gcc diff-so-fancy
