```bash
install gnome-disk-utility
install yay 
install conda nvm nvim 
```

**use for reconfig grub for fix stuck at initial ramdisks:**

how does i get out stuck at initial ramdisk:

- first, access local os:

```bash
mount /dev/sda2 /mnt
mount /dev/sda1 /mnt/boot
arch-chroot /mnt/
```

- second, remove all initframs and vmlinuz, amd-ucode on `\boot`

 - third, copy each vmlinuz from `usr\lib\modules` to boot

example:
```bash
cp \usr\lib\modules\6.10.10-lts..\vmlinuz \boot\vmlinuz-linux-lts
```

 - forth, check on `etc\modprob.d` have any file `.conf` if it exist remove it

- fifth, reinstall amd-ucode `pacman -S amd-ucode`

- six, run `mkinitcpio -P`

done!

--- 

config mhz for gpu ignore tearing when inactivity
```bash
sudo pacman -S lact
```

---

config firewall for open ports 

```bash
sudo pacman -S firewalld ipset ebtables
sudo systemctl enable --now firewalld
sudo systemctl start firewalld

sudo firewall-cmd --permanent --zone=public --add-service=ssh
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --add-port=2424/udp --permanent 
sudo firewall-cmd --add-port=2424/tcp --permanent
sudo firewall-cmd --zone=public --add-forward-port=port=2424:proto=tcp:toport=22 --permanent
sudo firewall-cmd --zone=public --add-forward-port=port=2424:proto=udp:toport=22 --permanent
sudo firewall-cmd --reload
```

