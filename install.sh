#!/bin/bash

echo "Cloning repos..."
git clone  https://github.com/RobinBoers/FramboxOS /home/pi/Frambox
git clone --recursive --depth 1 --branch master https://github.com/HerbFargus/retropie-splashscreens-extra /home/pi/RetroPie/splashscreens/retropie-extra

echo "Installing requierd packages..."
sudo apt-get install -y python3 idle3
sudo apt-get install -y python3-pip
sudo /home/pi/Frambox/install_pixel.sh
sudo apt-get install -y minecraft-pi
sudo apt-get install -y sonic-pi
sudo apt-get install -y hping3
sudo apt-get install -y nmap
sudo apt-get install -y python-wxgtk3.0
sudo apt-get install -y matchbox-keyboard

echo "Copying files..."
sudo cp -f /home/pi/Frambox/.bashrc /home/pi/.bashrc
sudo cp -f /home/pi/Frambox/splashscreen.list /etc/splashscreen.list
sudo cp -f /home/pi/Frambox/splashscreen.cfg /opt/retropie/configs/all/splashscreen.cfg
sudo cp -f /home/pi/Frambox/startes.sh /home/pi/startes.sh
sudo cp -f /home/pi/Frambox/lxterminal.conf /home/pi/.config/lxterminal/lxterminal.conf

echo "Enabling SSH..."
sudo systemctl enable ssh
# sudo cp -f /home/pi/Frambox/ssh /boot/ssh

echo "Setting up static IP and hostname..."
sudo cp -f /home/pi/Frambox/dhcpcd.conf /etc/dhcpcd.conf
sudo cp -f /home/pi/Frambox/hostname /etc/hostname
sudo cp -f /home/pi/Frambox/hosts /etc/hosts

echo "Installing gamelists and ports..."
sudo cp -R -f /home/pi/Frambox/roms/ /home/pi/RetroPie/
sudo cp -R -f /home/pi/Frambox/gamelists/ /opt/retropie/configs/all/emulationstation/

echo "Setting up Raspbian menu..."
sudo cp -R -f /home/pi/Frambox/applications /usr/share/raspi-ui-overrides/

echo "Please choose a new password:"
passwd

echo "Done. Please reboot now"
