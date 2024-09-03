# Remember to su into user account made in archinstall if running script in chroot
cd ~
# Install Yay
yes | sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && yes | makepkg -si
# Install required packages from Yay
yes | yay -S btrfs-assistant partitionmanager mkinitcpio-firmware
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
# Download Background
cd ~/Pictures
sudo curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/bg.png
# Install optional packages from Yay (separated and commented out for now for quicker testing runs of script)
# yes | yay -S bolt-launcher orca-slicer-bin protonup-qt jamesdsp-pipewire-bin
# Remove subvolid on btrfs mounts as it breaks restores
sudo sed -i '/subvolid=[0-9]*/s/subvolid=[0-9]*,//g' /etc/fstab
# Remove consolefont hook to stop error for missing config
sed -i 's/consolefont//g' /etc/mkinitcpio.conf
