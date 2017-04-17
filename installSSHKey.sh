#!/bin/sh
#Create a ssh authentication key to the server

cd ~/.ssh/
ssh-keygen -C "warriv93@gmail.com"

#enter enter input required

#copy content of file
cat id_rsa.pub | xclip


cd ssh root@111111111:~/
mkdir .ssh
cd .ssh
#paste content to auth file
echo authorized_keys >> xclip -o
