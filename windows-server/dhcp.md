## How the PC Knows the DNS and DHCP Server IPs
1. **DHCP Process**: The PC discovers the **DHCP server** by broadcasting a **DHCP Discover** message, and the **DHCP server** responds with network configuration, including its own IP and DNS server IP(s).
2. **DNS Discovery**: The PC uses the DNS IP provided by DHCP or manually configured DNS servers to resolve domain names and find services like domain controllers.
3. **Domain Services**: In a domain-joined network, the **DNS server** (usually integrated with AD) helps the PC locate important domain resources like Domain Controllers.

This automatic discovery ensures the PC knows where to send requests for IP addresses and DNS queries.

----

## Install the DHCP Server

```
Install-WindowsFeature DHCP -IncludeManagementTools
```

## Autherization
After successfully installing the DHCP Server role, you need to **authorize** and configure your DHCP server.
```
Add-DhcpServerInDC -DnsName DHCP1.corp.contoso.com -IPAddress 10.0.0.3
```

To verify that the DHCP server is authorized in Active Directory, run the following command:
```
Get-DhcpServerInDC
```

### To authorize the DHCP server using Active Directory:

Open  Windows Administrative Tools > DHCP.
Expand your DHCP server name, right-click, and then select Authorize.
Authorization can take a few seconds to resolve. Refresh the server list to confirm that the DHCP Server is now authorized. If authorized, a green icon should appear in each scope.

## Create Scope:
create a new scope using the **Add-DhcpServerv4Scope** PowerShell command.

You can just run PowerShell on your computer in an elevated session.

E.g. To configure a new DHCP scope named Contoso network with a range from 10.10.10.100 to 10.10.10.200 and a subnet mask of 255.255.255.0, run the following command.

```
Add-DhcpServerv4Scope -Name "Contoso network" -StartRange 10.10.10.100 -EndRange 10.10.10.200 -SubnetMask 255.255.255.0
```

## Managing scope options

After configuring your new scope, you can manage scope options.

To modify scope options in the DHCP console:

In the DHCP console when connected to the DHCP server you wish to manage, expand the IPv4 node, then expand the scope with the options you wish to modify.

Select the **Scope Options** node.

Right-click on **Scope Options**, then select **Configure Options**.

Select the option you want to configure from the list of options.
To enable or disable a setting, select the checkbox and configure the option.
To configure the properties of an existing option, right-click on the option, then select **Properties**.

