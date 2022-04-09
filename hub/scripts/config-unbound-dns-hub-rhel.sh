#!/usr/bin/env bash

# Update packages
yum update -y
yum upgrade -y

# Install DNS packages
yum install unbound -y
 
 # Initialize unbound log file.
 # Configure SELinux to permit unbound daemon to write the log file.
 touch /var/log/unbound.log
 chown unbound:unbound /var/log/unbound.log
 semanage fcontext -a -t named_log_t "/var/log/unbound.log"
 restorecon -v /var/log/unbound.log

# Configure unbound DNS
cp -p /etc/unbound/unbound.conf /etc/unbound/unbound.conf.orig
cat > /etc/unbound/unbound.conf << EOF
server:
  chroot: ""
  logfile: /var/log/unbound.log
  verbosity: 1
  log-queries: yes
    interface: 0.0.0.0
      access-control: 10.0.0.0/16 allow
      access-control: 172.16.0.0/16 allow
      verbosity: 1

  # Forward lookups on "*.onprem.net" to on-premises DNS
  forward-zone:
    name: "onprem.net."
    forward-addr: 172.16.254.4   # on-prem DNS

  # Forward all other lookups to public DNS (e.g. Azure resolver)
  forward-zone:
    name: "."
    forward-addr: 168.63.129.16  # Azure resolver
EOF

# Configure firewall to allow DNS lookups
firewall-cmd --zone=public --add-service dns --permanent
firewall-cmd --reload

# Disable NetworkManager control of /etc/resolv.conf
cat > /etc/NetworkManager/conf.d/90-dns-none.conf << EOF
[main]
dns=none
EOF

# Set nameserver to local host
#echo "nameserver 127.0.0.1" > /etc/resolv.conf 

# Configure eth0 to use local unbound service for DNS lookups
#nmcli con mod "System eth0" ipv4.ignore-auto-dns true
#nmcli con mod "System eth0" ipv4.dns 127.0.0.1
#systemctl reload NetworkManager

# Enable and start unbound
systemctl enable unbound
systemctl start unbound
systemctl status unbound