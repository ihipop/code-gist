# Multi ddns updater in Pure Shell
# Support: 
- [x] duckdns
- [x] punyun
- [ ] more for future
# Usage

```bash
wget  https://github.com/ihipop/code-gist/raw/master/auto-script/DDNS/multi-ddns.sh /usr/local/bin/multi-ddns.sh 
chmod +x /usr/local/bin/multi-ddns.sh
multi-ddns.sh -h
```
```
Usage:  multi-ddns.sh [-d] -s duckdns DOMAIN TOKEN [IP]
        multi-ddns.sh [-d] -s pubyun AUTHSTRING(which is USERNAME:PASSWORD) DOMAIN [IP]

        -------ARGS-----------
        -d Enable random delay
```