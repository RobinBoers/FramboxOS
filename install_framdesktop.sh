#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y --no-install-recommends xorg xinit

sudo apt-get install -y openbox obconf
sudo apt-get install -y xfce4-notifyd
sudo apt-get install -y tint2
# sudo apt-get install -y xcompmgr cairo-dock