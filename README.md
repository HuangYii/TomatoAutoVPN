TomatoAutoVPN
=============

Tomato Auto VPN For PPTP

Tomato 策略路由

测试于 Tomato 的固件 110 by Shibby 

本项目主要解决 Shibby 固件因为 nvrom 参数的变化而导致 autoddvpn 项目不能兼容 tomato 固件的问题

采用全部国内 IP 指定网关走国内线路的方法，并使用 dnsmasq 来解析国内域名以解决线路问题

1.开启 jffs 
-----------------

Administration 里有 jffs

点开启就可以

不放心可以重启下

2.获取脚本
-----------------

ssh 到路由器

> mkdir /jffs/pptp

> cd /jffs/pptp

> wget http://raw.github.com/kevinzhow/TomatoAutoVPN/master/run.sh

> wget https://raw.github.com/kevinzhow/TomatoAutoVPN/master/vpnup.sh

> wget https://raw.github.com/kevinzhow/TomatoAutoVPN/master/vpndown.sh

> chmod a+x *.sh

> 如果路由器不能支持 https，可以试用 scp 命令从本地上传到路由器

3.确保你的路由器名字含有tomato
-----------------

Basic -> Identification

> Router Name 改成 tomato

4.DNSMasq
----------------------------------------------------------------------------------------------------------------------------------------
> 如果你会用 get.sh 那么就用这个高端方法，不会的话，请直接把 dns_server.txt 里的内容复制到你的路由器 Advanced 下 DHCP/DNS 的 Dnsmasq 文本框里

> 高端方法

> scp dns_server.txt root@192.168.1.1:/jffs/dnsmasq.conf

> 在 Advenced -> DHCP/DNS dnsmasq 的配置里写下 conf-file=/jffs/dnsmasq.conf

5.设置 WAN UP 的时候自动配置路由表
-----------------

路由管理界面里

Administration 的 Scripts 里面

给 WAN UP 添加如下命令

> sh /jffs/pptp/run.sh

保存，重启。

希望你人品够好，一次搞定。

> (PS 如果你的连接很不稳定，很慢，请尝试改小PPTP的 MTU MRU 值，比如 1300)

> (PS2 PPTP 配置里请勾选 Redirect Internet traffic)