# Remember to su into user account made in archinstall
cd ~
# Install Yay
yes | sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && yes | makepkg -si
# Install fast packages from Yay
yes | yay -S jamesdsp-pipewire-bin partitionmanager mkinitcpio-firmware btrfs-assistant snapper-support btrfsmaintenance
# Configure btrfs subvolumes
sudo snapper -c root create-config /
sudo snapper -c home create-config /home
sudo mkdir /.snapshots
sudo mount -a
sudo btrfs subvol set-default 256 /
# QEMU virtualization services
sudo systemctl enable libvirtd
sudo systemctl enable dnsmasq
# Printer services
sudo systemctl enable cups.service
# Download and apply KDE Plasma theme
# konsave would be used for CLI profile import but it does not support KDE Plasma 6... Removed until updated
#curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/konsave.knsv
#konsave -i konsave.knsv
#konsave -a konsave
# Download monitor ICM profile while still in /home
curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/EX240N.icm
# Apply Nvidia fixes
cd /etc/modprobe.d/
sudo curl -O https://raw.githubusercontent.com/imdabossou/archinstallconfig/main/desktop/nvidiadesktop.conf
# Apply SDDM Wayland
cd /etc/sddm.conf.d/
sudo curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/10-wayland.conf
# Download Background
cd ~/Pictures
sudo curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/bg.png
# Install slow packages from Yay
yes | yay -S bolt-launcher orca-slicer-bin protonup-qt 
