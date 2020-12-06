# FramboxOS

This script helps me to setup the my Raspberry Pi. It installs all the programs I use and sets all my preferences.<br><br>This is made for use with RetroPie.<br><br>
It includes:

- The PIXEL desktop (optional)
- Custom Desktop Enviorment (optional)
- A custom bashwelcometweak
- My favorite splashscreens
- My favorite themes (optional)
- A option to open MCPI and Vice BASIC from emulationtation
- Custom hostname
- Enable SSH
- Editted Raspbian menu
- Terminal configuration / preferences

It also installs:

- Minecraft Pi
- nmap
- hping3
- Python pip + IDLE
- Sonic Pi
- Matchbox Keyboard
- Firefox ESR
- Synaptic Package Manager

The custom desktop uses:

- lightdm
- openbox
- leafpad
- lxterminal
- xfce4-notifyd (notifications)
- tint2 (taskbar)
- dolphin (file manager)
- lxappearance
- nitrogen (wallpapers)
- custom config for openbox, lightdm, nitogen and tint2

## Installation

- Start with a fresh RetroPie image
- Install vice from RetroPie Setup -> Manage Packages -> Optional Packages -> vice -> Install
- If you are in Emulationstation, enter the terminal (with F4)

```bash
wget https://raw.githubusercontent.com/RobinBoers/FramboxOS/main/install.sh
sudo chmod 777 install.sh && sudo chmod a+x install.sh
sudo ./install.sh
```

- Reboot
