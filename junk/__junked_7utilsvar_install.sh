#!/bin/bash

sudo apt-get install -y ranger caca-utils highlight atool w3m poppler-utils mediainfo
ranger --copy-config=all

rm -rf $HOME/.config/ranger || true
ln -s $PWD/subconfs/ranger $HOME/.config/ranger || true

sudo apt install -y cmus vlc
sudo apt install -y at

echo 'bind -f common q shell tmux detach' > $HOME/.config/cmus/rc

sudo apt-get install -y safeeyes
sudo apt-get install -y xprintidle
sudo apt-get install -y stgit

ln -s $PWD/resources/safeeyes.sh $HOME/safeeyes.sh
ls -l $HOME/safeeyes.sh
cp ./resources/safeeyes.json $HOME/.config/safeeyes/safeeyes.json

sudo ln -s $PWD/safeeyes.service /lib/systemd/system/safeeyes.service
sudo systemctl start safeeyes
sudo systemctl enable safeeyes

sudo cp ./resources/var-scripts/gitpush /usr/local/bin
sudo chmod +x /usr/local/bin/gitpush

sudo apt-get install -y taskwarrior cpanminus
rm -rf $HOME/.task
ln -s $HOME/Documents/code/tasking/.task.d $HOME/.task
rm -rf $HOME/tasknotes
ln -s $HOME/Documents/code/tasking/.tasknotes.d $HOME/tasknotes

rm -rf /tmp/taskopen || true
git clone https://github.com/ValiValpas/taskopen.git /tmp/taskopen
pushd /tmp/taskopen
sudo make PREFIX=/usr install
popd
rm $HOME/.taskrc
ln -s $PWD/taskconfigs/.taskrc $HOME/.taskrc

rm $HOME/.taskopenrc
ln -s $PWD/taskconfigs/.taskopenrc $HOME/.taskopenrc
rm $HOME/.taskopenrc1
ln -s $PWD/taskconfigs/.taskopenrc1 $HOME/.taskopenrc1
sudo cpanm install JSON


sudo apt-get install -y vifm
sudo cp ./resources/var-scripts/attach_vifm /usr/local/bin
sudo chmod +x /usr/local/bin/attach_vifm

sudo cp ./resources/var-scripts/xcat /usr/local/bin
sudo chmod +x /usr/local/bin/xcat
sudo gem install zeal

sudo apt-get install -y nomacs
sudo apt-get install -y  sdcv
ln -s $PWD/resources/tridactylrc $HOME/.config/tridactyl/tridactylrc
