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
sudo cp /home/pi/Frambox/.bashrc /home/pi/.bashrc
sudo cp /home/pi/Frambox/splashscreen.list /etc/splashscreen.list

echo "Setting up static IP..."
sudo cp /home/pi/Frambox/dhcpcd.conf /etc/dhcpcd.conf

echo "Installing gamelists and ports..."
sudo cp -R /home/pi/Frambox/roms/ /home/pi/RetroPie/roms/
sudo cp -R /home/pi/Frambox/gamelists/ /opt/retropie/configs/all/emulationstation/gamelists/

echo "Setting up Raspbian menu..."
sudo cp -R /home/pi/Frambox/applications /usr/share/raspi-ui-overrides/applications

echo "Done. Please reboot now"
