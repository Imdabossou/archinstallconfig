# Remember to su into user account made in archinstall if running script in chroot
cd ~
# Install Yay
yes | sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && yes | makepkg -si
# Install required packages from Yay
yes | yay -S partitionmanager mkinitcpio-firmware
# QEMU virtualization services
sudo systemctl enable libvirtd
# Printer services
sudo systemctl enable cups.service
# Download monitor ICM profile while still in /home
curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/EX240N.icm
# Apply Nvidia fixes
cd /etc/modprobe.d/
sudo curl -O https://raw.githubusercontent.com/imdabossou/archinstallconfig/main/desktop/nvidiadesktop.conf
# Apply SDDM Wayland
sudo mkdir /etc/sddm.conf.d/
cd /etc/sddm.conf.d/
sudo curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/10-wayland.conf
# Download Background and icon
cd ~/Pictures
sudo curl -O https://raw.githubusercontent.com/imdabossou/archinstallconfig/main/desktop/bg.png
sudo curl -O https://raw.githubusercontent.com/imdabossou/archinstallconfig/main/desktop/icon.png
# Install optional packages from Yay (separated so it can be commented out for quicker testing runs of script)
yes | yay -S bolt-launcher bambustudio-bin protonup-qt vesktop-bin whatsie
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
sudo timeshift --btrfs
sudo systemctl enable cronie
# Leave su
exit
# Leave chroot
exit
# Restart to apply changes (disabled until script completed)
reboot now
