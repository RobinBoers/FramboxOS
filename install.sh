#!/bin/bash

echo "Cloning repos..."
git clone --recursive --depth 1 --branch main https://github.com/RobinBoers/FramboxOS /home/pi/Frambox
git clone --recursive --depth 1 --branch master https://github.com/HerbFargus/retropie-splashscreens-extra /home/pi/RetroPie/splashscreens/retropie-extra

echo "Installing requierd packages..."
sudo apt install -y python3 idle3
sudo apt install -y python3-pip
sudo apt install -y dialog

echo "Installing pixel..."
sudo apt update
sudo apt -y upgrade

sudo apt install -y --no-install-recommends xorg lxde xcursor-themes

# Pi-top OS + Firefox
sudo apt install -y pt-ui-mods firefox-esr gvfs

# Raspbian + Chromium
# sudo apt install -y raspberrypi-ui-mods rpi-chromium-mods gvfs

# Weird launcher, gonna be replaced with my own soon
# sudo apt install -y lxlauncher

echo "Setting up Raspbian menu..."
sudo cp -R -f /home/pi/Frambox/applications /usr/share/raspi-ui-overrides/

sudo apt install -y synaptic
sudo apt install -y minecraft-pi
echo "Installing sonic-pi"
sudo apt install sonic-pi
sudo apt install -y hping3
sudo apt install -y nmap
sudo apt install -y python-wxgtk3.0
sudo apt install -y matchbox-keyboard

echo "Installing themes..."

# Install Emulationstation themes trough GUI
dialog --title "Themes" --msgbox "Do you want to install ES themes? Press <Enter> to install or <Esc> to cancel." 10 50
# Return status of non-zero indicates cancel
if [ "$?" != "0" ]
then
  dialog --title "Themes" --msgbox "Installation was \ canceled at your
  request." 10 50
else
  dialog --title "Themes" --infobox "Installing themes..." 10 50
  sleep 2

  mkdir -p "/etc/emulationstation/themes"
  git clone https://github.com/RetroPie/es-theme-simple.git /etc/emulationstation/themes/simple
  git clone https://github.com/ehettervik/es-theme-pixel.git /etc/emulationstation/themes/pixel
  git clone https://github.com/ehettervik/es-theme-workbench.git /etc/emulationstation/themes/workbench
  git clone https://github.com/mattrixk/es-theme-io.git /etc/emulationstation/themes/io
  git clone https://github.com/HerbFargus/es-theme-tronkyfran.git /etc/emulationstation/themes/tronkyfran
  git clone https://github.com/lilbud/es-theme-minimal.git /etc/emulationstation/themes/minimal
  git clone https://github.com/ruckage/es-theme-snes-mini.git /etc/emulationstation/themes/snes-mini
  git clone https://github.com/chicueloarcade/es-theme-Chicuelo.git /etc/emulationstation/themes/Chicuelo
  git clone https://github.com/waweedman/es-theme-pii-wii.git /etc/emulationstation/themes/pii-wii
  
fi

echo "Copying files..."
sudo cp -f /home/pi/Frambox/.bashrc /home/pi/.bashrc
sudo cp -f /home/pi/Frambox/splashscreen.list /etc/splashscreen.list
sudo cp -f /home/pi/Frambox/splashscreen.cfg /opt/retropie/configs/all/splashscreen.cfg
sudo cp -f /home/pi/Frambox/startes.sh /home/pi/startes.sh
sudo mkdir /home/pi/.config/lxterminal
sudo cp -R -f /home/pi/Frambox/lxterminal.conf /home/pi/.config/lxterminal/lxterminal.conf
sudo chmod 777 /home/pi/.config/lxterminal/lxterminal.conf

echo "Installing gamelists and ports..."
sudo cp -f /home/pi/Frambox/es_systems.cfg /opt/retropie/configs/all/emulationstation/es_systems.cfg
sudo cp -R -f /home/pi/Frambox/roms/ /home/pi/RetroPie/
sudo cp -R -f /home/pi/Frambox/gamelists/ /opt/retropie/configs/all/emulationstation/

echo "Enabling SSH..."
sudo systemctl enable ssh
# sudo cp -f /home/pi/Frambox/ssh /boot/ssh

echo "Setting up static IP and hostname..."
sudo cp -f /home/pi/Frambox/dhcpcd.conf /etc/dhcpcd.conf
sudo cp -f /home/pi/Frambox/hostname /etc/hostname

echo "Please choose a new password: (for pi user)"
passwd pi

sudo cp -f /home/pi/Frambox/hosts /etc/hosts
echo "Done. Please reboot now"
