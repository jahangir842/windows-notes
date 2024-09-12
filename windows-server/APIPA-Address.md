### APIPA (Automatic Private IP Addressing) Address - Short Notes

APIPA (Automatic Private IP Addressing) is a feature in Windows operating systems that automatically assigns an IP address to a device when a DHCP server is unavailable. The IP address range for APIPA is from **169.254.0.1** to **169.254.255.254**, with the subnet mask **255.255.0.0**.

#### Key Points:
- **Purpose**: Used when a device cannot obtain an IP address from a DHCP server.
- **Range**: 169.254.0.0 to 169.254.255.255.
- **Private Network**: APIPA addresses are non-routable, meaning they are used only for local communication within the same subnet.
- **Automatic Assignment**: Devices on the same network using APIPA can communicate with each other without manual configuration.
- **Self-Healing**: If a DHCP server becomes available later, the device will automatically switch to a valid IP address.

APIPA helps ensure basic communication within local networks when DHCP is temporarily unavailable.
