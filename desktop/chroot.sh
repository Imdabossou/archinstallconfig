# Install Yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
# Install packages from Yay
yes | yay -S bolt-launcher orca-slicer-bin protonup-qt jamesdsp-pipewire-bin partitionmanager mkinitcpio-firmware btrfs-assistant snapper-support btrfsmaintenance konsave
# Configure btrfs subvolumes
sudo snapper -c root create-config /
sudo snapper -c home create-config /home
sudo mkdir /.snapshots
sudo mount -a
sudo btrfs subvol set-default 256 /
# QEMU virtualization services
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo systemctl enable dnsmasq
sudo systemctl start dnsmasq
# Printer services
sudo systemctl enable cups.service
sudo systemctl start cups.service
