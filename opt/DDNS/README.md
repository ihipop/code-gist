# Multi ddns updater in Pure Shell
# Support: 
- [x] [DuckDNS](https://www.duckdns.org/)
- [x] [PubYun (Known as 3322.org)](https://www.pubyun.com/)
- [ ] more for future
# Usage

```bash
wget https://github.com/ihipop/code-gist/raw/master/auto-script/DDNS/multi-ddns.sh  -O /usr/local/bin/multi-ddns.sh && chmod +x /usr/local/bin/multi-ddns.sh
multi-ddns.sh -h
```
```
Usage:  multi-ddns.sh [-d] -s duckdns -4 [IPv4] -6 [IPv6] DOMAIN TOKEN 
        multi-ddns.sh [-d] -s pubyun -4 [IPv4] DOMAIN AUTHSTRING(which is USERNAME:PASSWORD)  

        -------ARGS-----------
        -d Enable random delay
```