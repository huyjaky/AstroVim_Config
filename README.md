install gnome-disk-utility
install yay 
install conda nvm nvim 

use for reconfig grub for fix stuck at initial ramdisks:

```
mount /dev/sda2 /mnt
mount /dev/sda1 /mnt/boot
arch-chroot /mnt/

```
-> remove file /boot/grub/grub.cfg

```
grub-mkconfig -o /boot/grub/grub.cfg
```
