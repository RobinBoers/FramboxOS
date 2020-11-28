#!/bin/bash

echo "Installing requierd packages..."
sudo apt-get install -y python3 idle3
sudo apt-get install -y python3-pip
sudo apt-get install -y minecraft-pi
sudo apt-get install -y hping3
sudo apt-get install -y nmap
sudo apt-get install -y python-wxgtk3.0
sudo apt-get install -y matchbox-keyboard

echo "Cloning repo..."
git clone  https://github.com/RobinBoers/FramboxOS /home/pi/Frambox

echo "Copying files..."
sudo cp -f /home/pi/Frambox/.bashrc /home/pi/.bashrc
sudo cp -f /home/pi/Frambox/splashscreen.list /etc/splashscreen.list
sudo cp -f /home/pi/Frambox/startes.sh /home/pi/startes.sh

echo "Setting up static IP..."
sudo cp -f /home/pi/Frambox/dhcpcd.conf /etc/dhcpcd.conf

echo "Installing gamelists and ports..."
sudo cp -R -f /home/pi/Frambox/roms/ /home/pi/RetroPie/roms/
sudo cp -R -f /home/pi/Frambox/gamelists/ /opt/retropie/configs/all/emulationstation/gamelists/

echo "Setting up Raspbian menu..."
sudo cp -R -f /home/pi/Frambox/applications /usr/share/raspi-ui-overrides/applications

echo "Done. Please reboot now"
