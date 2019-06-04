# Multi ddns updater in Pure Shell
# Support: 
- [x] [DuckDNS](https://www.duckdns.org/)
- [x] [PubYun (Known as 3322.org)](https://www.pubyun.com/)
- [ ] more for future
# Usage

```bash
wget  https://github.com/ihipop/code-gist/raw/master/auto-script/DDNS/multi-ddns.sh  -O /usr/local/bin/multi-ddns.sh && chmod +x /usr/local/bin/multi-ddns.sh
multi-ddns.sh -h
```
```
Usage:  multi-ddns.sh [-d] -s duckdns DOMAIN TOKEN [IP]
        multi-ddns.sh [-d] -s pubyun AUTHSTRING(which is USERNAME:PASSWORD) DOMAIN [IP]

        -------ARGS-----------
        -d Enable random delay
```