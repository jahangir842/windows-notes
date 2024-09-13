appwiz.cpl
WDS...Since 2012 R2
Images... 10/11, pro or enterprise...select single. liscensed or not
with swith,,, pxe boot, use NIC for this, 
conect pc with switch, DORA Discovery for dhcp, ip assign, 
2 methods for WDS... wds+dhcp standalone envirment without authentication... or make wds a member server.
wds responds options.
boot priority auto hdd after installation..
boot priority should be pxe from vendor if bulk.
100 meter range for switch,
add role .... wds.... 2 roles should ON... deployment server and transport server...
services stop problem.... increase memory(most of time).
cant edit disk virtually if there is any checkpoint.
installation media verification....open iso image of windows... in sources,,, boot.wim (windows image), install.wim are essential.
wds takes memory like sql
after installation,,, open wds console,,, check name of server,,,, it will be not configured,,, 
study wds article...

now configure it,,, 
study the before you begin criterial 
ntfs.... for OS files....... used by windows packages like wds,, used by profile data...
refs latest and used for data.. packet size big,,, used in SAN ,,, where only data and not OS files ,, built resilent... no compression... 

intergrate or standslone,,, 

remote install path that should be ntfs. can change the drive but dont change the default name.
try to use other than c.

pxe respond to: 
know clients are those allow filtered: enable filter options in properties of IPv4... make list of txt file tab delimiter to add mac in bulk... often get from vender... 

require approval in "not know" option.

stop sign on wds server name... 

pending devices,,, multicast transmission...







