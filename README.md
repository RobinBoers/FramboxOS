# FramboxOS

This script automatticly installs things I need in RetroPie. This makes it easier to get everything running after a chrash / fresh start. It's mainly for personal use only, but I tought I would share it on github.<br><br>
It includes:

- A custom bashwelcometweak
- My favorite splashscreens
- A option to open MCPI and Vice BASIC from emulationtation
- Custom hostname
- Editted Raspbian menu

It also installs:

- Minecraft Pi, nmap, hping3, Python pip + IDLE, matchbox-keyboard

## Installation

- Start with a fresh RetroPie image
- Install PIXEL desktop from RetroPie Setup -> Configuration / Tools -> Raspbian Tools -> Install desktop
- Install vice from RetroPie Setup -> Manage Packages -> Optional Packages -> vice -> Install
- Enter terminal (with F4)

- ~~~wget <https://raw.githubusercontent.com/RobinBoers/FramboxOS/main/install.sh>~~~

- ~~~sudo chmod 777 install.sh && sudo chmod a+x install.sh~~~

- ~~~sudo ./install.sh~~~

- Reboot
