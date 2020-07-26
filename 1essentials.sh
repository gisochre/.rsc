#!/bin/bash
#set -e

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get install neovim

sudo apt-get install curl wget tree
sudo apt-get install xfonts-terminus console-terminus

sudo apt install -y rxvt-unicode
#rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
softhome=$HOME/Documents/soft
mkdir -p $softhome
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev
. alacritty_install.sh
sudo cp ./var-scripts/days-between /usr/local/bin
sudo chmod +x /usr/local/bin/days-between

sudo cp ./var-scripts/alarmsequence /usr/local/bin
sudo chmod +x /usr/local/bin/alarmsequence

sudo cp ./var-scripts/set-bri /usr/local/bin
sudo chmod +x /usr/local/bin/set-bri
# sudo add-apt-repository -y ppa:mmstick76/alacritty
# sudo apt-get install -y alacritty
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
sudo apt-get install -y zsh

pushd /tmp
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
sudo dpkg -i bat_0.12.1_amd64.deb
popd


pushd /tmp
git clone https://github.com/TomboFry/menu-surfraw.git
pushd menu-surfraw
sudo cp menu-surfraw /usr/local/bin
sudo apt install -y rofi
sudo apt-get install -y surfraw
popd

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions


ln -s $PWD/.dircolors $HOME/.dircolors
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.zprofile $HOME/.zprofile
cp better-completion.zsh $HOME/.oh-my-zsh/custom/
sudo ln -s $PWD/var-scripts/fe /usr/local/bin/fe
sudo ln -s $PWD/var-scripts/fw /usr/local/bin/fw
chsh -s `which zsh`
