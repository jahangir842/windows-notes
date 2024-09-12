## How the PC Knows the DNS and DHCP Server IPs
1. **DHCP Process**: The PC discovers the **DHCP server** by broadcasting a **DHCP Discover** message, and the **DHCP server** responds with network configuration, including its own IP and DNS server IP(s).
2. **DNS Discovery**: The PC uses the DNS IP provided by DHCP or manually configured DNS servers to resolve domain names and find services like domain controllers.
3. **Domain Services**: In a domain-joined network, the **DNS server** (usually integrated with AD) helps the PC locate important domain resources like Domain Controllers.

This automatic discovery ensures the PC knows where to send requests for IP addresses and DNS queries.

----

Install the DHCP Server

```
Install-WindowsFeature DHCP -IncludeManagementTools
```
