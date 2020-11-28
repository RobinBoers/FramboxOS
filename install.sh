#!/bin/bash

echo "Installing requierd packages"
sudo apt install minecraft-pi
sudo apt install hping3
sudo apt install nmap
sudo apt-get install -y python-wxgtk3.0
sudo apt-get install -y matchbox-keyboard

echo "Cloning repo..."
git clone  https://github.com/RobinBoers/FramboxOS /home/pi/Frambox

echo "Copying files..."
sudo cp /home/pi/Frambox/.bashrc /home/pi/.bashrc
sudo cp /home/pi/Frambox/splashscreen.list /etc/splashscreen.list

echo "Installing gamelists and ports"
sudo cp -R /home/pi/Frambox/roms/ /home/pi/RetroPie/roms/
sudo cp -R /home/pi/Frambox/gamelists/ /opt/retropie/configs/all/emulationstation/gamelists/

echo "Done. Please reboot now"
