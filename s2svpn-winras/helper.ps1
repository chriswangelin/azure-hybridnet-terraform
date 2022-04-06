# Get-AzPublicIpAddress -ResourceGroupName hub-rg | Where name -like '*vpng-pip' | Select -ExpandProperty ipaddress
# Get-AzVirtualNetwork -ResourceGroupName hub-rg | select -ExpandProperty AddressPrefix 
# az network vnet list --resource-group hub-rg