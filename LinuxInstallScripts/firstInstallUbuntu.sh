#!/bin/sh
# kör inte som root eller sudo


# skapar temp mapp
echo "Skapar temp mapp"
mkdir ~/temp

# laddar ner deb att installera
echo "laddaner debs"
#wget -O ~/temp/google-webdesigner_amd64.deb https://dl.google.com/linux/direct/google-webdesigner_current_amd64.deb
wget -O ~/temp/atom.deb https://atom.io/download/deb
wget -O ~/temp/appgrid.deb http://ppa.launchpad.net/appgrid/stable/ubuntu/pool/main/a/appgrid/appgrid_0.213_all.deb

# lägger till repositorys
sudo add-apt-repository ppa:appgrid/stable
sudo add-apt-repository ppa:numix/ppa
sudo add-apt-repository ppa:thefanclub/ubuntu-after-install
sudo add-apt-repository ppa:atareao/atareao
sudo add-apt-repository ppa:undistract-me-packagers/daily
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo add-apt-repository ppa:webupd8team/brackets
sudo add-apt-repository ppa:webupd8team/java

sudo apt-get update

# install apps
echo "Install apps"
sudo apt-get install undistract-me sshfs xbindkeys vlc git htop openssh-client openssh-server nitrogen ubuntu-after-install my-weather-indicator indicator-multiload tlp tlp-rdw redshift redshift-gtk nitrogen volti tint2 gsimplecal lxtask brackets
# not standard
sudo apt-get install appgrid preload 

#isntall java Oracle version
sudo apt-get install oracle-java7-installer
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
#confirm java installation
sudo update-java-alternatives -s java-7-oracle
sudo apt-get install oracle-java7-set-default

# Iconer
sudo apt-get install numix-icon-theme numix-icon-theme-circle
#sudo dpkg -i ~/temp/google-webdesigner_amd64.deb
sudo dpkg -i ~/temp/atom.deb
sudo dpkg -i ~/temp/appgrid.deb

#remove unneeded stuff
sudo apt-get autoremove unity-lens-music unity-lens-photos unity-lens-shopping unity-lens-video

# skapar mappar
echo "skapar mappar"
sudo mkdir /script
#mkdir -p ~/.config/tint2/
#mkdir -p ~/.config/openbox/

# rättigheter/behörighet
echo "ger rättigheter/behörigheter"
sudo chown -R $USER:$USER /script
sudo chmod -R 777 /script

# hämtning av installeringar
echo "hämtar installeringar"
echo ". /usr/share/undistract-me/long-running.bash notify_when_long_running_commands_finish_install" >> ~/.bashrc

# rensar upp
echo "rensar upp"
rm -r ~/temp
cd /usr/local/bin && redshift-gtk
