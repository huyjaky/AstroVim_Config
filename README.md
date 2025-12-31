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
On Arch linux base that using an iptables for default network firewall. I dont want to use it because it suck. So i moves on `Firewalld` 

### How are we changing from iptables to firewalld 

1. removing complete iptables: 
	```Bash 
	sudo iptables -F
	sudo iptables -X
	sudo iptables -t nat -F
	sudo iptables -t nat -X
	sudo iptables -t mangle -F
	sudo iptables -t mangle -X

	systemctl list-unit-files | grep iptables
	sudo systemctl disable --now iptables.service 2>/dev/null
	sudo systemctl disable --now ip6tables.service 2>/dev/null
	sudo pacman -Rns iptables

	sudo rm -rf /etc/iptables
	sudo rm -f /etc/iptables/iptables.rules
	sudo rm -f /etc/iptables/ip6tables.rules

	sudo pacman -S nftables
	sudo systemctl enable --now nftables

	sudo pacman -S gufw
	```

2. configurating firewalld 
	```bash 
	sudo firewall-cmd --zone=public --add-masquerade --permanent
	sudo firewall-cmd --zone=public --query-masquerade
	sudo firewall-cmd --reload
	```

3. opening port for service 
	```bash
	sudo firewall-cmd --zone=<zone> --add-port=<PORT>/<PROTOCOL> --permanent
	sudo firewall-cmd --reload
	```

### For making window can listen request from dns 
I dont know some how but if we change DNS listen on Settings UI it is suck, we must change by command: 

turn on terminal at `Admin` and run command below:
```bash 
PS C:\Users\huyph> Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ("192.168.1.204","::")
PS C:\Users\huyph> Get-DnsClientServerAddress
```
