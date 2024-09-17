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

## Finish laptop section (after desktop is done)
### yay asusctl yay rog-control-center

### Konsole Fish Default

In Konsole, settings, configure Konsole,
then profile, Edit, Command : /usr/bin/fish


