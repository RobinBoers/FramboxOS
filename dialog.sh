#!/bin/sh

# Let the uset choose a desktop enviorment
dialog --backtitle "Desktop Enviorment" --menu "Choose one:" 10 50 3 1 FramboxDE 2 Pixel 3 none

# Return status of non-zero indicates cancel
if [ "$?" != "0" ]
then
  dialog --title "Desktop Enviorment" --msgbox "Script was \ canceld" 10 50

# Install no desktop enviorment
if [ "$?" != "3" ]
then
  dialog --title "Desktop Enviorment" --infobox "Installing no Desktop Enviorment" 10 50
  sleep 2

# Install pixel
else if [ "$?" = "2" ]
then
  dialog --title "Desktop Enviorment" --infobox "Installing Pixel..." 10 50
  sudo /home/pi/Frambox/install_pixel.sh

# install FramboxDE
if [ "$?" = "1" ]
then
  dialog --title "Desktop Enviorment" --infobox "Installing FramboxDE..." 10 50
  sudo /home/pi/Frambox/install_framdesktop.sh

fi