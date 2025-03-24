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

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# enhancd
git clone https://github.com/babarot/enhancd ~/enhancd && source ~/enhancd/init.sh
