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
  # sudo apt-get install -y lxlauncher

  echo "Setting up Raspbian menu..."
  sudo cp -R -f /home/pi/Frambox/applications /usr/share/raspi-ui-overrides/

# install FramboxDE
elif [ "$?" = "1" ]
then
  sudo apt-get update
  sudo apt-get upgrade

  sudo apt-get install -y lightdm

  sudo apt-get install -y openbox obconf openbox-menu obmenu
  sudo apt-get install -y lxterminal
  sudo apt-get install -y leafpad  
  sudo apt-get install -y xfce4-notifyd
  sudo apt-get install -y tint2
  # sudo apt-get install -y dolphin
  # sudo apt-get install -y xcompmgr cairo-dock
  sudo apt-get install -y pcmanfm
  sudo apt-get install -y lxappearance
  sudo apt-get install -y nitrogen
  sudo apt-get install -y xcompmgr
  sudo apt-get install -y pavucontrol
  sudo apt-get install -y volti
  sudo apt-get install -y rofi
  sudo apt-get install -y lxtask
  sudo apt-get install -y elementary-xfce-icon-theme
  sudo apt-get install -y xarchiver
  sudo apt-get install -y lxrandr

  sudo cp -R -f /home/pi/Frambox/.gtkrc-2.0-mine /home/pi/.gtkrc-2.0-mine
  sudo cp -R -f /home/pi/Frambox/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
  sudo cp -R -f /home/pi/Frambox/.config/ /home/pi/
  sudo cp -f /home/pi/Frambox/autostart_openbox.sh /home/pi/.config/openbox/autostart.sh

  sudo chmod 777 /home/pi/.config/openbox/autostart.sh
  sudo chmod 777 /home/pi/.config/openbox/menu.xml
  sudo chmod 777 /home/pi/.config/tint2/tint2rc
  sudo chmod 777 /home/pi/.config/lxterminal/lxterminal.conf

fi

sudo apt-get install -y synaptic
sudo apt-get install -y minecraft-pi
echo "Installing sonic-pi"
sudo apt-get install sonic-pi
sudo apt-get install -y hping3
sudo apt-get install -y nmap
echo "Installing firefox"
sudo apt-get install firefox-esr
sudo apt-get install -y python-wxgtk3.0
sudo apt-get install -y matchbox-keyboard

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
