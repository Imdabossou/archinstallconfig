# Does not work when run in chroot
cd ~
# Install Yay
yes | sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && yes | makepkg -si
# Install required packages from Yay
# Xpadneo seems to be required to fix xbox controller as triggers dont work on default drivers
yes | yay -S partitionmanager mkinitcpio-firmware konsave epson-inkjet-printer-escpr2 opencl-amd xpadneo-dkms protonup-qt-bin jamesdsp-pipewire-bin
# xpadneo may be required as triggers occasionally dont work on default drivers although xpadneo seems to break battery reporting? Test out battery levels to see if under 100% is reported
# QEMU virtualization services
sudo systemctl enable libvirtd
# Printer services
sudo systemctl enable cups.service
# Power profiles daemon
sudo systemctl enable --now power-profiles-daemon
# Download monitor ICM profile
cd ~/Documents/
curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/EX240N.icm
# Apply SDDM Wayland
sudo mkdir /etc/sddm.conf.d/
cd /etc/sddm.conf.d/
sudo curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/10-wayland.conf
# Konsave KDE config import - if wallpaper and icon does not apply, they are located in ~/.local/share/wallpapers and ~/.local/share/icons
cd ~/
curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/arch.knsv
konsave -i arch.knsv
konsave -a arch
#OpenRGB Config
mkdir ~/.config/OpenRGB/
cd ~/.config/OpenRGB/
curl -O https://raw.githubusercontent.com/imdabossou/archinstallconfig/main/desktop/OpenRGB.json
curl -O https://raw.githubusercontent.com/imdabossou/archinstallconfig/main/desktop/Profile.orp
# Bluetooth
sudo modprobe btusb
sudo systemctl enable bluetooth
# Install slower packages from Yay (separated so it can be commented out for quicker testing runs of script)
yes | yay -S bolt-launcher bambustudio-bin zapzap
# TEMPORARY alternative whatsapp launcher due to qt bug breaking zapzap
yes | yay -S whatsapp-for-linux
# Remove subvolid on btrfs mounts as it breaks restores
sudo sed -i '/subvolid=[0-9]*/s/subvolid=[0-9]*,//g' /etc/fstab
# Remove consolefont hook to stop error for missing config
sudo sed -i 's/consolefont//g' /etc/mkinitcpio.conf
# Virtual 5.1 Upmix Audio
sudo mkdir /usr/share/pipewire/pipewire.conf.d/
cd /usr/share/pipewire/pipewire.conf.d/
sudo curl -O https://raw.githubusercontent.com/imdabossou/archinstallconfig/refs/heads/main/desktop/25-sink-upmix-5.1.conf
systemctl --user restart pipewire.service
# Timeshift Config
cd /etc/timeshift
sudo rm /etc/timeshift/default.json
sudo curl -O https://raw.githubusercontent.com/imdabossou/archinstallconfig/main/desktop/default.json
sudo systemctl enable cronie
sudo timeshift --btrfs
sudo timeshift --check
# AutoUpdate
curl --silent https://raw.githubusercontent.com/cmuench/pacman-auto-update/master/install.sh | bash
# Restart to apply changes (disabled until script completed)
sudo reboot now
