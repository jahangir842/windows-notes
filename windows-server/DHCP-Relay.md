## DHCP Relay

A DHCP relay agent works as an intermediary between DHCP clients and DHCP servers that aren't on the same subnet or local network. The DHCP Relay Agent forwards DHCP broadcast messages from clients to a remote server, letting clients obtain IP addresses and other network configuration information from a DHCP server located on a different subnet.

To install the DHCP relay agent on Windows Server, you need to deploy the Remote Access server role. The DHCP relay agent is a feature of Remote Access and isn't included in the DHCP server role.

## Prerequisites

Before you can install your DHCP relay agent, you must have the following prerequisites:

    A computer running Windows Server in the remote subnet where you want to install the DHCP relay agent.
    A DHCP server with a DHCP scope configured for the remote subnet.
