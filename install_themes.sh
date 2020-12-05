#!/bin/sh

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