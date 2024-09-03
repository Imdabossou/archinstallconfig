# notes
## desktop/config.sh - konsave removed due to issues

### Download and apply KDE Plasma theme
konsave would be used for CLI profile import but it does not support KDE Plasma 6... Removed until updated

#curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/konsave.knsv

#konsave -i konsave.knsv

#konsave -a konsave

If konsave is not fixed, will make a KDE theme. For the time being just set theme manually. Set bg.png as Wallpaper image for KDE, and then set under Screen Locking -> Configure Appearance. Click user account icon to change to Icon.png. Set Colors & Themes to Breeze Dark. Right click Taskbar ->Show Panel Configuration -> Set Position > Top Arrow. Remove Discover from Taskbar shortcuts and Favourites. Login Screen (SDDM) -> Apply Plasma Settings.

## DNSMASQ DISABLED
If dnsmasq starts automatically it breaks qemu/kvm as it needs to start its own instance.


#sudo systemctl enable dnsmasq 

## BTRFS
Removed any instances of subvolid from /etc/fstab. Restoring into snapshat using subvolid can result in a dead system.

btrfs-grub removed as I don't see the point of booting into a snapshot when it can be restored by command.


# todo

## Finish laptop section
### yay asusctl yay rog-control-center

## BTRFS  - needs configuring
Currently trying snapper, unsure on using snapper or timeshift yet.


### SNAPPER requires some jank following up from archinstall subvolumes. Requires a build from AUR for GUI and has no dark mode.
sudo umount /.snapshots

sudo rm -r /.snapshots

sudo snapper -c root create-config /

sudo snapper -c home create-config /home

sudo btrfs subvolume delete /.snapshots

sudo mkdir /.snapshots

sudo mount -a

sudo systemctl start snapper-timeline

sudo systemctl start snapper-cleanup


### TIMESHIFT requires copying config file into /etc/timeshift - (below script is unfinished). NO AUR and small file. dark mode. may require xorg-xhost 

sudo pacman -S timeshift

rm /etc/timeshift/default.json

curl -O (download link to fixed default.json)

sudo timeshift --btrfs





