# FramboxOS

This script automatticly installs things I need in RetroPie. This makes it easier to get everything running after a chrash / fresh start. It's mainly for personal use only, but I tought I would share it on github.<br><br>
It includes:

- A custom bashwelcometweak
- My favorite splashscreens
- A option to open MCPI and Vice BASIC from emulationtation

It also installs:

- Minecraft Pi, nmap, hping3, python pip

## Installation

- Start with a fresh RetroPie image
- Install PIXEL from RetroPie Setup -> Configuration / Tools -> Raspbian Tools -> Install desktop
- Download retropie-extra splashscreens from RetroPie Setup -> splashscreen -> Download RetroPie-Extra splashscreens
- Install vice from RetroPie Setup -> Manage Packages -> Optional Packages -> vice -> Install
- Install DOSBox from RetroPie Setup -> Manage Packages -> Optional Packages -> dosbox -> Install
- Enter terminal (with F4)
- <code>wget https://raw.githubusercontent.com/RobinBoers/FramboxOS/master/install.sh</code>
- <code>sudo chmod 777 install.sh && sudo chmod a+x install.sh</code>
- <code>sudo ./install.sh</code>
- Reboot