### Troubleshooting Checklist

Check the following settings:

- **DHCP Server Status**: Ensure the DHCP server service is running. You can verify this by running the `net start` command and checking if **DHCP Server** is listed.
  
- **DHCP Server Authorization**: Confirm the DHCP server is authorized. Refer to **Windows DHCP Server Authorization** for domain-joined scenarios.

- **IP Address Leases**: Verify that available IP address leases exist within the DHCP server scope for the client’s subnet. This can be checked in the DHCP server management console under scope statistics.

- **BAD_ADDRESS Entries**: Look for any **BAD_ADDRESS** listings in the **Address Leases** section of the DHCP management console.

- **Static IP Addresses**: Check for devices with static IP addresses that haven’t been excluded from the DHCP scope.

- **DHCP Server Binding**: Ensure the DHCP server is bound to at least one IP address in the subnet that the scope is serving (unless using a DHCP relay). You can check this using the `Get-DhcpServerv4Binding` or `Get-DhcpServerv6Binding` cmdlets, or under **IPv4 / IPv6 Advanced Properties** in the DHCP management console.

- **UDP Port Availability**: Verify that only the DHCP server is using UDP ports 67 and 68 by running `netstat -anb`. No other services (like WDS or PXE) should be occupying these ports.

- **IPsec Exemption**: If operating in an IPsec environment, confirm that the DHCP server has an IPsec exemption configured.

- **Relay Agent Check**: Ensure the relay agent’s IP address is reachable from the DHCP server by pinging it.

- **DHCP Policies and Filters**: Review and verify all configured DHCP policies and filters.

### Event Logs

Check the **System** and **DHCP Server service** event logs under **Applications and Services Logs** > **Microsoft** > **Windows** > **DHCP-Server** for any issues related to the problem. Depending on the issue, events will be logged under the following channels:

- DHCP Server Operational Events
- DHCP Server Administrative Events
- DHCP Server System Events
- DHCP Server Filter Notification Events
- DHCP Server Audit Events

### Data Collection

#### DHCP Server Log

The **DHCP Server debug logs** offer insights into IP address lease assignments and DNS dynamic updates performed by the DHCP server. These logs are typically stored in **%windir%\System32\Dhcp**. For more information, refer to the **Analyze DHCP Server Log Files** documentation.

#### Network Trace

A network trace can help determine the DHCP server’s activity at the time of an issue. To capture a network trace using **Windows Troubleshooting Tools (TSS)**, follow the instructions in **DHCP Troubleshooting Guidance - Data Collection**.
