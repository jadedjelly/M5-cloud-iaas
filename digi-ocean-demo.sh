!#/bin/bash

# update linux vm
apt update && apt upgrade -y

# install correct Ver of Java 
apt install openjdk-8-jre-headless -y

# clone repo
git clone https://gitlab.com/twn-devops-bootcamp/latest/05-cloud/java-react-example

# cd to project folder and build app w/ gradle
cd java-react-example && gradle build

# scp jar file to DO-VM
scp java-react-example.jar root@46.101.212.166:/root

# Create firewall rule on dropliet, opening 7071 for app

# Run jar file
java -jar java-react-example.jar &

# create user
useradd john

# add to sudo grp
usermod -aG sudo john

# copy pub key from local & cp to new linux user "john", create .ssh folder & an "authorized_keys" file and cp pub key here
mkdir .ssh && sudo nano authorized_keys

# ssh from new user to server

ssh john@<IP addy of droplet>
