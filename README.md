install gnome-disk-utility
install yay 
install conda nvm nvim 

use for reconfig grub for fix stuck at initial ramdisks:

```bash
mount /dev/sda2 /mnt
mount /dev/sda1 /mnt/boot
arch-chroot /mnt/

```

-idk how its work but do same thing below
-> change file name from grub.cfg to grub.cfg.off

```bash
mv grub.cfg grub.cfg.off
```
-> reboot and reboot command grub command line:
```bash
grub>reboot
```

-> rename grub.cfg.off to grub.cfg
```bash
mv grub.cfg.off grub.cfg
```
