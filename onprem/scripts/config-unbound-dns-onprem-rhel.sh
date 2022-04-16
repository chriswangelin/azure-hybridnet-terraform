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
    name: "azure-automation.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "database.windows.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "sql.azuresynapse.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "sqlondemand.azuresynapse.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "dev.azuresynapse.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "azuresynapse.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "blob.core.windows.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "table.core.windows.net"
    forward-addr: 10.0.254.4   

  forward-zone:
    name: "queue.core.windows.net"
    forward-addr: 10.0.254.4     

  forward-zone:
    name: "file.core.windows.net"
    forward-addr: 10.0.254.4    
    
  forward-zone:
    name: "web.core.windows.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "dfs.core.windows.net"
    forward-addr: 10.0.254.4    	

  forward-zone:
    name: "documents.azure.com"
    forward-addr: 10.0.254.4    	

  forward-zone:
    name: "mongo.cosmos.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "cassandra.cosmos.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "gremlin.cosmos.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "table.cosmos.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "central.batch.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "eastus.batch.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "westus.batch.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "postgres.database.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "mysql.database.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "mariadb.database.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "vault.azure.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "vaultcore.azure.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "managedhsm.azure.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "centralus.azmk8s.io"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "eastus.azmk8s.io"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "westus.azmk8s.io"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "search.windows.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "azurecr.io"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "azconfig.io"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "centralus.backup.windowsazure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "eastus.backup.windowsazure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "westus.backup.windowsazure.com"
    forward-addr: 10.0.254.4
    
  forward-zone:
    name: "centralus.hypervrecoverymanager.windowsazure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "eastus.hypervrecoverymanager.windowsazure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "westus.hypervrecoverymanager.windowsazure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "servicebus.windows.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "azure-devices.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "eventgrid.azure.net"
    forward-addr: 10.0.254.4
  
  forward-zone:
    name: "	azurewebsites.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "api.azureml.ms"
    forward-addr: 10.0.254.4
    
  forward-zone:
    name: "notebooks.azure.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "instances.azureml.ms"
    forward-addr: 10.0.254.4
    
  forward-zone:
    name: "aznbcontent.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "service.signalr.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "monitor.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "oms.opinsights.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "ods.opinsights.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "agentsvc.azure-automation.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "cognitiveservices.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "afs.azure.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "datafactory.azure.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "adf.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "redis.cache.windows.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "redisenterprise.cache.azure.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "purview.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "digitaltwins.azure.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "azurehdinsight.net"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "his.arc.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "guestconfiguration.azure.com"
    forward-addr: 10.0.254.4

  forward-zone:
    name: "media.azure.net"
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

# Start a background job that restarts network manager every 3 seconds until the vnet-level DNS server setting
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
