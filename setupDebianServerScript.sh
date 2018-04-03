echo Setup users
adduser simon
gpasswd -a simon sudo

echo Switch to main user
su simon

echo Create a new directory called .ssh and restrict its permissions
mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys


echo install applications
sudo apt-get update

echo basic server packages 
sudo apt-get install git build-essential curl openssl libssl-dev mongodb

echo other packages
sudo apt-get install fish 



echo setup nginx 
sudo apt-get install nginx
sudo service nginx start

echo setup nodejs 9.x
curl -sL https://deb.nodesource.com/setup_9.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs
sudo ln -s /usr/bin/nodejs /usr/bin/node

echo install basic server packages 
sudo npm install -g yarn
sudo npm install -g pm2

echo Install mongodb
sudo apt-get install dirmngr
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.6 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt-get update
sudo apt-get install -y mongodb-org


echo Give Safe User Permission To Use Port 80
sudo apt-get install libcap2-bin
sudo setcap cap_net_bind_service=+ep /usr/bin/node

echo install admin mongo
git clone https://github.com/mrvautin/adminMongo.git && cd adminMongo
npm install && cd .. 

echo start pm2 as a service
sudo env PATH=$PATH:/usr/local/bin pm2 startup -u simon






echo extra setup
# set ssh root login false - PermitRootLogin no

# sudo nano /etc/ssh/sshd_config
# sudo systemctl restart ssh 


echo successfully setup the server!!!
