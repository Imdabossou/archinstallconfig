# **Personal install notes for Arch using archinstall**

## Desktop Install

-Boot Arch ISO

-Connect to Network

> iwctl

> station wlan0 connect 'SSID HERE'

-Install Arch

> archinstall --config https://raw.githubusercontent.com/imdabossou/archinstallconfig/main/desktop/install.json

-After install reboot and login then run in terminal

> curl -sL https://github.com/imdabossou/archinstallconfig/raw/main/desktop/config.sh | bash
