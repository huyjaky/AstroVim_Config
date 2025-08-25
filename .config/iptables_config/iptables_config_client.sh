#!/bin/bash
# IPv4/IPv6 Simple & Safe firewall ruleset using iptables/ip6tables
# Equivalent to the provided nftables configuration

# Flush existing rules
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X

ip6tables -F
ip6tables -X
ip6tables -t nat -F
ip6tables -t nat -X
ip6tables -t mangle -F
ip6tables -t mangle -X

# Set default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

ip6tables -P INPUT DROP
ip6tables -P FORWARD DROP
ip6tables -P OUTPUT ACCEPT

# IPv4 Rules
# Allow established and related connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT -m comment --comment "allow tracked connections"

# Allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT -m comment --comment "allow from loopback"

# Allow ICMP
iptables -A INPUT -p icmp -j ACCEPT -m comment --comment "allow icmp"

# Allow SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT -m comment --comment "allow sshd"

# Open port ranges (WARNING: open ports)
iptables -A INPUT -p tcp --dport 8501:8509 -j ACCEPT -m comment --comment "open port range 8501-8509"
iptables -A INPUT -p tcp --dport 8511:8519 -j ACCEPT -m comment --comment "open port range 8511-8519"

# IPv6 Rules
# Allow established and related connections
ip6tables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT -m comment --comment "allow tracked connections"

# Allow loopback traffic
ip6tables -A INPUT -i lo -j ACCEPT -m comment --comment "allow from loopback"

# Allow ICMPv6
ip6tables -A INPUT -p ipv6-icmp -j ACCEPT -m comment --comment "allow icmp v6"

# Allow SSH
ip6tables -A INPUT -p tcp --dport 23 -j ACCEPT -m comment --comment "allow sshd"

# Open port ranges (WARNING: open ports)
ip6tables -A INPUT -p tcp --dport 8501:8509 -j ACCEPT -m comment --comment "open port range 8501-8509"
ip6tables -A INPUT -p tcp --dport 8511:8519 -j ACCEPT -m comment --comment "open port range 8511-8519"

echo "Firewall rules applied successfully"
echo "Current iptables rules:"
iptables -L -n -v
echo ""
echo "Current ip6tables rules:"
ip6tables -L -n -v
