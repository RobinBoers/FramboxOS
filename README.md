# FramboxOS

This script helps me to setup the my Raspberry Pi. It installs all the programs I use and sets all my preferences.<br><br>This is made for use with RetroPie.<br><br>
It includes:

- The PIXEL desktop
- A custom bashwelcometweak
- My favorite splashscreens
- My favorite themes (optional)
- A option to open MCPI and Vice BASIC from emulationtation
- Custom hostname
- Enable SSH
- Clean Raspbian menu
- LXTerminal color scheme

It also installs:

- Minecraft Pi
- nmap
- hping3
- Python pip + IDLE
- Sonic Pi
- Matchbox Keyboard
- Firefox ESR
- Synaptic

My custom desktop is moved to it's own repo now. You can find it here: <br><https://github.com/RobinBoers/FramboxDesktop>

It uses a static IP: 192.168.1.36

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
