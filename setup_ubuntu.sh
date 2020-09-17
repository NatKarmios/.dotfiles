#!/usr/bin/env bash

sudo apt install -y zsh tmux stow make

# Set up zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -f ~/.zshrc
rm ~/.bashrc
stow -t ~ shell
chsh -s $(which zsh)


# Install Emacs 27
git clone --branch emacs-27 --depth 1 https://github.com/emacs-mirror/emacs.git
cd emacs
./autogen.sh && ./configure && make
sudo make install
cd ..
rm -rf emacs


# Install DOOM Emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
rm -rf ~/.doom.d
stow -t ~ doom
