#!/bin/sh
# kör inte som root eller sudo


# skapar temp mapp
echo "Create temporary folder"
mkdir ~/temp

sudo pacman -S --noconfirm --needed wget base-devel yajl 

#setup yaourt
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..

#sync system package database
yaourt -Syu --devel --aur

#Bluetooth
echo "Installing bluetooth components"
yaourt -S --noconfirm bluez bluez-utils

# install basic apps
echo "Install basic apps"
yaourt -S --noconfirm sshfs vlc git htop tlp tlp-rdw preload discord-canary spotify wps-office megasync libinput-gestures chromium google-chrome deluge n1 fish xfluxd

#setup xfluxd
systemctl --user enable xfluxd

#touchpad gestures setup,  arch - libinput-gestures
#A user must be a member of the input group, i.e. run:
sudo gpasswd -a $USER input
sudo chown -R simon /dev/input
sudo chmod 777 /dev/input
#A user can start libinput-gestures from their DE, or run:
libinput-gestures-setup start
#A user can enable auto start of libinput-gestures, i.e. run:
libinput-gestures-setup autostart
echo "Configuration files are at:
   /etc/libinput-gestures.conf (system wide default)"


# developer dependencies
echo "Installing developer dependencies"
sudo pacman -S --noconfirm nodejs npm mongodb

# install IDEAS
echo "Install IDEAS"
yaourt -S --noconfirm atom-editor intellij-idea-ultimate-edition

#isntall java? 
yaourt -S --noconfirm jdk jre 

# Icons
echo "Downloading numix icons"
yaourt -S --noconfirm xcursor-comix

#setting fish to default terminal shell
echo "setting fish to default terminal shell"
chsh -s /usr/bin/fish 

# skapar mappar
echo "skapar mappar"
sudo mkdir /scripts
#mkdir -p ~/.config/tint2/
#mkdir -p ~/.config/openbox/

# rättigheter/behörighet
echo "ger rättigheter o behörigheter"
sudo chown -R $USER:$USER /scripts
sudo chmod -R 777 /scripts

# rensar upp
echo "rensar upp"
rm -r ~/temp
cd /usr/local/bin

echo "setup xfluxd by editing: /etc/xfluxd.conf with   LAT=12.996072,  LON=55.581470 TEMP=3200 " 
