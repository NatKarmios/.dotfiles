#!/usr/bin/env bash

sudo apt update
sudo apt install -y zsh tmux stow curl

# Install node
curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
NODE_VERSION=node_12.x
DISTRO="$(lsb_release -s -c)"
echo "deb https://deb.nodesource.com/$NODE_VERSION $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/$NODE_VERSION $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list
sudo apt update
sudo apt install -y nodejs

# Install npm packages
sudo npm install -g tldr

# Install WSL scripts
sudo ln -s $(pwd)/_scripts/withdisplay /usr/bin/withdisplay 
sudo ln -s $(pwd)/_scripts/withwslpaths /usr/bin/withwslpaths 

# Set up zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
rm -f ~/.zshrc
rm ~/.bashrc
stow -t ~ shell
chsh -s $(which zsh)


# Install Emacs 27
sudo apt install -y autoconf automake autotools-dev bsd-mailx build-essential \\
    diffstat gnutls-dev imagemagick libasound2-dev libc6-dev libdatrie-dev \\
    libdbus-1-dev libgconf2-dev libgif-dev libgnutls28-dev libgpm-dev libgtk2.0-dev \\
    libgtk-3-dev libice-dev libjpeg-dev liblockfile-dev liblqr-1-0 libm17n-dev \\
    libmagickwand-dev libncurses5-dev libncurses-dev libotf-dev libpng-dev \\
    librsvg2-dev libsm-dev libthai-dev libtiff5-dev libtiff-dev libtinfo-dev libtool \\
    libx11-dev libxext-dev libxi-dev libxml2-dev libxmu-dev libxmuu-dev libxpm-dev \\
    libxrandr-dev libxt-dev libxtst-dev libxv-dev quilt sharutils texinfo xaw3dg \\
    xaw3dg-dev xorg-dev xutils-dev zlib1g-dev libjansson-dev libxaw7-dev \\
    libselinux1-dev libmagick++-dev libacl1-dev
git clone --branch emacs-27 --depth 1 https://github.com/emacs-mirror/emacs.git
cd emacs
./autogen.sh && ./configure && make -j8
sudo make install
cd ..
rm -rf emacs


# Install DOOM Emacs
rm -rf ~/.emacs.d
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
rm -rf ~/.doom.d
stow -t ~ doom
