#!/bin/bash

###MONERO BUILD 
#RUN AS ROOT USER.
#TESTED AND BUILT ON UBUNTU 18.04 SERVER.
#MINIMUM SPECS: 2 CPU 8 CORES, 16 RAM, 250 SSD, 10GBPS FIBER OPTIC.
#Use at your OWN RISK.
#Apache 2.0 License.
###

ulimit -c unlimited;
config_setting=$1;
prime_config="prime";
optional_config="optional";
if [ $config_setting = $prime_config ]
then
apt update && apt upgrade -y;
sudo apt install qtmultimedia5-dev qml-module-qtmultimedia libzbar-dev -y;
apt update && apt upgrade;
apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y;
apt install uuid-dev npm nodejs-dev node-gyp  libssl1.0-dev -y;
apt update && apt upgrade -y;
git clone https://github.com/xmrig/xmrig-proxy.git;
git clone https://github.com/xmrig/xmrig.git;
git clone https://github.com/tpruvot/cpuminer-multi;
mkdir xmrig/build;
sudo apt-get install automake libtool autoconf -y;
cd xmrig/build;
cmake .. -DXMRIG_DEPS=scripts/deps;
make -j$(nproc) ;
apt-get update;sudo apt install rpcbind -y;
    sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT;
     sudo iptables -I INPUT 1 -i lo -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 18080 -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 18081 -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 18082 -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 18083 -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 18084 -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 3333 -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 4444 -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 5555 -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 6666 -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 7777 -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 8888 -j ACCEPT;
     sudo iptables -A INPUT -p tcp --dport 9999 -j ACCEPT;
     iptables-save;
apt install make; apt install make-guile -y;
apt install pacman -y;
wget https://downloads.getmonero.org/cli/monero-linux-x64-v0.15.0.1.tar.bz2;
tar xvfo monero-linux-x64-v0.15.0.1.tar.bz2 ;
 rm -f monero-linux-x64-v0.15.0.1.tar.bz2;
 mv monero-x86_64-linux-gnu-v0.15.0.1/ monero;
 cd monero;
 pacman -Syu;
./bin/monerod --log-file monerod.log --detach;

sudo apt-get install software-properties-common -y;
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y;


###
#OPTIONAL ::
###
echo "\n";
echo "\n";
echo "\n";
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%";
echo "\n";
val1=$1;
command1="runopt";
elif [  $config_setting = $optional_config ]
then
	echo "\n";
	echo "!!!!!!!  RUNNING OPTIONAL COMMANDS: !!!!!!!";
	echo "\n";
	echo $1;
	cd ~/ ;
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
	apt-get install docker docker.io -y;
	curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
	chmod +x /usr/local/bin/docker-compose;
	ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose;
	iptables -A INPUT -i lo -j ACCEPT;sudo iptables -A OUTPUT -o lo -j ACCEPT;
	iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT;
	iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT;
	iptables -A INPUT -p tcp --match multiport --dports 1024:65000 -j ACCEPT;
	iptables-save;
	apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev -y;
	apt-get install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ -y;
	apt-get install software-properties-common -y;
	add-apt-repository ppa:bitcoin/bitcoin;
	apt-get install software-properties-common -y;
	apt-get install libdb4.8-dev libdb4.8++-dev -y;
	apt-get install libminiupnpc-dev libzmq3-dev -y;
	apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev -y;
	apt-get install python-pip -y;
 	#pip install pyblake2 ;
	git clone https://github.com/blockcollider/bcnode;
  	apt install yarn -y;
  	curl https://sh.rustup.rs -sSf | sh ;
else
	echo "ERROR: Status 1. Bad Command line Argument.";
	exit;
fi
