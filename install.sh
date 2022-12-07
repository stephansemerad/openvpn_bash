#Procedure: Ubuntu 20.04 LTS Set Up OpenVPN Server In 5 Minutes
# https://www.cyberciti.biz/faq/ubuntu-20-04-lts-set-up-openvpn-server-in-5-minutes/


# Step 1 – Update your system
sudo apt update && upgrade -y

# Step 2 – Find and note down your IP address
my_ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
echo $my_ip

# Step 3 – Download and run openvpn-install.sh script

wget https://git.io/vpn -O openvpn-ubuntu-install.sh

chmod -v +x openvpn-ubuntu-install.sh
sudo ./openvpn-ubuntu-install.sh


# sudo systemctl stop openvpn-server@server.service
# ## OR when using password to protect vpn ##
# sudo systemctl stop openvpn@server.service



# sudo systemctl start openvpn-server@server.service
# ## OR when using password to protect vpn ##
sudo systemctl stop openvpn-server@server.service
sudo systemctl start openvpn-server@server.service
sudo systemctl status openvpn-server@server.service

#Step 4 – Connect an OpenVPN server using iOS/Android/Linux/Windows desktop client
/root/openvpn.ovpn
