#!/bin/bash

echo "Cloning repos..."
git clone  https://github.com/RobinBoers/FramboxOS /home/pi/Frambox
git clone --recursive --depth 1 --branch master https://github.com/HerbFargus/retropie-splashscreens-extra /home/pi/RetroPie/splashscreens/retropie-extra

echo "Installing requierd packages..."
sudo apt-get install -y python3 idle3
sudo apt-get install -y python3-pip
sudo apt-get install -y dialog

# Let the uset choose a desktop enviorment
dialog --backtitle "Desktop Enviorment" --menu "Choose one:" 10 50 3 1 FramboxDE 2 Pixel 3 none

# Return status of non-zero indicates cancel
if [ "$?" != "0" ]
then
  dialog --title "Desktop Enviorment" --msgbox "Script was \ canceld" 10 50

# Install no desktop enviorment
elif [ "$?" = "3" ]
then
  dialog --title "Desktop Enviorment" --infobox "Installing no Desktop Enviorment" 10 50
  sleep 2

# Install pixel
elif [ "$?" = "2" ]
then
  sudo apt-get update
  sudo apt-get upgrade

  sudo apt-get install -y --no-install-recommends xorg lxde
  sudo apt-get install -y raspberrypi-ui-mods rpi-chromium-mods gvfs

# install FramboxDE
elif [ "$?" = "1" ]
then
  sudo apt-get update
  sudo apt-get upgrade

  sudo apt-get install -y --no-install-recommends xorg xinit

  sudo apt-get install -y openbox obconf
  sudo apt-get install -y xfce4-notifyd
  sudo apt-get install -y tint2
  # sudo apt-get install -y xcompmgr cairo-dock

fi

sudo apt-get install -y minecraft-pi
sudo apt-get install -y sonic-pi
sudo apt-get install -y hping3
sudo apt-get install -y nmap
sudo apt-get install -y python-wxgtk3.0
sudo apt-get install -y matchbox-keyboard

echo "Installing themes..."

# Install Emulationstation themes trough GUI
dialog --title "Themes" --msgbox "Do you want \ to install ES themes? \
\ press <Enter> \ to install or \
<Esc> to cancel." 10 50
# Return status of non-zero indicates cancel
if [ "$?" != "0" ]
then
  dialog --title "Themes" --msgbox "Installation was \ canceled at your
  request." 10 50
else
  dialog --title "Themes" --infobox "Installing themes..." 10 50
  sleep 2

  mkdir -p "/etc/emulationstation/themes"
  git clone "/etc/emulationstation/themes/simple" "https://github.com/RetroPie/es-theme-simple.git"
  git clone "/etc/emulationstation/themes/pixel" "https://github.com/ehettervik/es-theme-pixel.git"
  git clone "/etc/emulationstation/themes/workbench" "https://github.com/ehettervik/es-theme-workbench.git"
  git clone "/etc/emulationstation/themes/io" "https://github.com/mattrixk/es-theme-io.git"
  git clone "/etc/emulationstation/themes/tronkyfran" "https://github.com/HerbFargus/es-theme-tronkyfran.git"
  git clone "/etc/emulationstation/themes/minimal" "https://github.com/lilbud/es-theme-minimal.git"
  git clone "/etc/emulationstation/themes/snes-mini" "https://github.com/ruckage/es-theme-snes-mini.git"
  git clone "/etc/emulationstation/themes/Chicuelo" "https://github.com/chicueloarcade/es-theme-Chicuelo.git"
  git clone "/etc/emulationstation/themes/pii-wii" "https://github.com/waweedman/es-theme-pii-wii.git"
  
fi

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
