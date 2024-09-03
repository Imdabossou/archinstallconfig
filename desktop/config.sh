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
# Download Background and icon
cd ~/Pictures
sudo curl -O https://raw.githubusercontent.com/imdabossou/archinstallconfig/main/desktop/bg.png
sudo curl -O https://raw.githubusercontent.com/imdabossou/archinstallconfig/main/desktop/icon.png
# Install optional packages from Yay (separated and commented out for now for quicker testing runs of script)
#yes | yay -S bolt-launcher orca-slicer-bin protonup-qt jamesdsp-pipewire-bin
# Remove subvolid on btrfs mounts as it breaks restores
sudo sed -i '/subvolid=[0-9]*/s/subvolid=[0-9]*,//g' /etc/fstab
# Remove consolefont hook to stop error for missing config
sudo sed -i 's/consolefont//g' /etc/mkinitcpio.conf
#Fix BTRFS config conflict from archinstall and start snapshots
#SWAP OUT FOR TIMESHIFT CONFIG IF IT WORKS
sudo umount /.snapshots
sudo rm -r /.snapshots
sudo snapper -c root create-config /
sudo snapper -c home create-config /home
sudo btrfs subvolume delete /.snapshots
sudo mkdir /.snapshots
sudo mount -a
sudo systemctl start snapper-timeline
sudo systemctl start snapper-cleanup
# Restart to apply changes
#sudo restart now
