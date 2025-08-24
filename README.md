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

## SSH tunneling 
1. first u must have port 22 available on 192.168.1.1 virtual trigger 
2. uncomment `port 22` on file follow path `/etc/ssh/sshd_config`
3. `sudo systemctl enable sshd | systemctl start --now sshd`
-> after that u can connect to ssh. it means u doesnt need add open port 22 



## Open port 

-> This is depend on your method firewall u have 
-> file config on `/etc/nftables.conf`
```bash
#!/usr/bin/nft -f
# vim:set ts=2 sw=2 et:

# IPv4/IPv6 Simple & Safe firewall ruleset.
# More examples in /usr/share/nftables/ and /usr/share/doc/nftables/examples/.

destroy table inet filter
table inet filter {
  chain input {
    type filter hook input priority filter
    policy drop

    # ct state invalid drop comment "early drop of invalid connections"
    ct state {established, related} accept comment "allow tracked connections"
    iif lo accept comment "allow from loopback"
    ip protocol icmp accept comment "allow icmp"
    meta l4proto ipv6-icmp accept comment "allow icmp v6"
    tcp dport ssh accept comment "allow sshd"
    # pkttype host limit rate 5/second counter reject with icmpx type admin-prohibited

    # WARNING: open port right here
    tcp dport 8501-8509 accept
    tcp dport 8511-8519 accept
    tcp dport 8521-8529 accept
    counter
  }
  chain forward {
    type filter hook forward priority filter
    policy drop
  }
}
```
-> after config run command `sudo nft -f /etc/nftables.conf`



-> in my case, i have `nftables` 
- `sudo nft -a list chain inet filter input` : list current port and rule was accepted 
- `sudo nft add rule inet filter input tcp dport 8505 accept` : add open port (in case is 8505)
- `sudo nft add rule inet filter input tcp dport '{ 8501-8509 }' accept` : add open port range 
- `sudo nft delete rule inet filter input handle 16` : if u use command `list chain` (first command) u will see a number for each rule to replace for a number 16 
