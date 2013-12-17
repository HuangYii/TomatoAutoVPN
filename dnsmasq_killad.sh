#!/bin/sh
touch /jffs/dnsmasq.conf/dnsmasq.ads
wget -O - http://adblock-chinalist.googlecode.com/svn/trunk/adblock-lazy.txt |
grep ^\|\|[^\*]*\^$ |
sed -e 's:||:address\=\/:' -e 's:\^:/127\.0\.0\.1:' > /jffs/dnsmasq.conf/dnsmasq.ads
grep conf-file /jffs/dnsmasq.conf/dnsmasq.ads ||