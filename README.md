install gnome-disk-utility
install yay 
install conda nvm nvim 

use for reconfig grub for fix stuck at initial ramdisks:

how does i get out stuck at initial ramdisk:

first, access local os:

```bash
mount /dev/sda2 /mnt
mount /dev/sda1 /mnt/boot
arch-chroot /mnt/
```

second, remove all initframs and vmlinuz, amd-ucode on `\boot`

third, copy each vmlinuz from `usr\lib\modules` to boot
example:
```bash
cp \usr\lib\modules\6.10.10-lts..\vmlinuz \boot\vmlinuz-linux-lts
```

forth, check on `etc\modprob.d` have any file `.conf` if it exist remove it

fifth, reinstall amd-ucode `pacman -S amd-ucode`

six, run `mkinitcpio -P`

done!

