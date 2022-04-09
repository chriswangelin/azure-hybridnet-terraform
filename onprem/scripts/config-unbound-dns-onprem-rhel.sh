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

  # Authoritative records for on-prem hosts
  local-zone: "onprem.net." static

    local-data: "onprem-winra-vm.onprem.net.      IN A 172.16.0.4"
    local-data: "onprem-dns-vm-001.onprem.net.    IN A 172.16.254.4"

    local-data-ptr: "172.16.0.4   onprem-winra-vm.onprem.net"
    local-data-ptr: "172.16.254.4 onprem-dns-vm-001.onprem.net"

  # Forward all other lookups to private DNS
  forward-zone:
    name: "."
    forward-addr: 10.0.254.4  # private DNS
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
echo "nameserver 127.0.0.1" > /etc/resolv.conf 

# Confiugure eth0 to use local unbound service for DNS lookups
#nmcli con mod "System eth0" ipv4.ignore-auto-dns true
#nmcli con mod "System eth0" ipv4.dns 127.0.0.1
#systemctl reload NetworkManager

# Enable and start unbound
systemctl enable unbound
systemctl start unbound
systemctl status unbound