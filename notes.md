desktop/config.sh - konsave removed due to issues

#Download and apply KDE Plasma theme
#konsave would be used for CLI profile import but it does not support KDE Plasma 6... Removed until updated
#curl -O https://github.com/imdabossou/archinstallconfig/raw/main/desktop/konsave.knsv
#konsave -i konsave.knsv
#konsave -a konsave

Timeshift - issues if not configured before use

@home subvolume not included in snapshots by default

sudo nano/etc/fstab - remove any instances of subvoloid. restoring into snapshat using subvoloid results in a dead system

