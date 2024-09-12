ADC - Additional Domain Controller

eventvwr.msc

Check replication: repadmin /replsummary

Check replication method 2: Active Directory Sites and Services:
Press Win + R, type dssite.msc

Check NTDS Settings:
The NTDS settings hold replication-related data and can give insights into replication health.
Check replication partners using:
repadmin /showreps


DC Diagonastic: The dcdiag tool is a diagnostic utility for domain controllers.
command:   dcdiag /v

To target specific tests:

dcdiag /test:<TestName>

Example tests:

    dcdiag /test:DNS: Tests DNS configuration and issues.
    dcdiag /test:replications: Tests replication health.

Verify FSMO role health with:
netdom query fsmo

Ensure the SYSVOL and NETLOGON shares are accessible and replicated across domain controllers. You can check by visiting:
\\<DC-Name>\SYSVOL
\\<DC-Name>\NETLOGON
