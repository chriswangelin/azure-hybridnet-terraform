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
    local-data: "onprem-mgmt-vm.onprem.net.       IN A 172.16.255.4"

    local-data-ptr: "172.16.0.4   onprem-winra-vm.onprem.net"
    local-data-ptr: "172.16.254.4 onprem-dns-vm-001.onprem.net"
    local-data-ptr: "172.16.255.4 onprem-mgmt-vm.onprem.net"

  forward-zone:
    name: "azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "azure.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "azconfig.io"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "azmk8s.io"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "aznbcontent.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "azurecr.io"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "azure-automation.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "azure-devices.net"
    forward-addr: 10.0.254.4   

  forward-zone:
    name: "azurehdinsight.net"
    forward-addr: 10.0.254.4     

  forward-zone:
    name: "azureml.ms"
    forward-addr: 10.0.254.4    
    
  forward-zone:
    name: "azuresynapse.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "azurewebsites.net"
    forward-addr: 10.0.254.4    	

  forward-zone:
    name: "signalr.net"
    forward-addr: 10.0.254.4    	

  forward-zone:
    name: "windowsazure.com"
    forward-addr: 10.0.254.4

  # Forward all other lookups to private DNS
  forward-zone:
    name: "."
    forward-addr: 168.63.129.16  # private DNS
EOF

# Configure firewall to allow DNS lookups
firewall-cmd --zone=public --add-service dns --permanent
firewall-cmd --reload

# Enable and start unbound
systemctl enable unbound
systemctl start unbound
systemctl status unbound

# Restarting network manager every 3 seconds until the vnet-level DNS server setting
# is picked up in resolv.conf
nohup bash -c '
while :
do
  grep "nameserver.*172.16.254.4" /etc/resolv.conf
  if [ $? -eq 0 ]; then
    break
  else
    systemctl restart NetworkManager
    sleep 3
  fi
done' > /tmp/poll_resolv_conf.out &
