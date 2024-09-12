## How the PC Knows the DNS and DHCP Server IPs
1. **DHCP Process**: The PC discovers the **DHCP server** by broadcasting a **DHCP Discover** message, and the **DHCP server** responds with network configuration, including its own IP and DNS server IP(s).
2. **DNS Discovery**: The PC uses the DNS IP provided by DHCP or manually configured DNS servers to resolve domain names and find services like domain controllers.
3. **Domain Services**: In a domain-joined network, the **DNS server** (usually integrated with AD) helps the PC locate important domain resources like Domain Controllers.

This automatic discovery ensures the PC knows where to send requests for IP addresses and DNS queries.

----

## Determining the Scope that a User Gets
When a user logs in to a network using an Active Directory (AD) user ID, the process of determining which DHCP scope should provide an IP address is primarily driven by the client's network configuration and DHCP server setup. 

The DHCP server determines which scope to use based on the network segment or subnet that the client is connected to. Active Directory authentication does not affect this process; instead, it relies on proper network and DHCP server configuration to ensure that clients receive IP addresses from the appropriate scope based on their location in the network.

----

## Install the DHCP Server

```
Install-WindowsFeature DHCP -IncludeManagementTools
```

## Open DHCP Management Console:

On your Windows Server, open the DHCP Management Console by typing **dhcpmgmt.msc** in the Run dialog or through the Server Manager.

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

## Managing reservations



To convert an existing DHCP lease to a reservation using the DHCP console, right-click the lease in the **Address Leases** node of a specific Scope and then select **Add to Reservation**.

To create a new reservation for a specific scope, right-click the **Reservations** node of a scope, then select **New Reservation**. You then need to provide a name for the reservation, IP address, and the MAC address associated with the host's NIC.

