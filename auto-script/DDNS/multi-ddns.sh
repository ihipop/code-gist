#!/bin/bash
# This is a multi ddns updater written by <ihipop@gmail.com> @ 2019-06-04 18:39:50
# use -h to get the help
set -e
DELAY_SECONDS=0

function_exists() {
    declare -f -F "$1" > /dev/null
    return $?
}

show_useage() {
    MY=$(basename "$0")
    cat <<EOF
Usage:  ${MY} [-d] -s duckdns -4 [IPv4] -6 [IPv6] DOMAIN TOKEN 
        ${MY} [-d] -s pubyun -4 [IPv4] DOMAIN AUTHSTRING(which is USERNAME:PASSWORD)  

        -------ARGS-----------
        -d Enable random delay
EOF
}

ISP_duckdns(){
    DOMAIN=$1
    TOKEN=$2
    curl -ssL 'https://www.duckdns.org/update?domains='"${DOMAIN}"'&token='"${TOKEN}"'&verbose=true&ip='"${IPv4}"'&ipv6='"${IPv6}" -k -o -
}


ISP_pubyun(){
    DOMAIN=$2
    AUTHSTRING=$1
    curl -ssL 'https://'"${AUTHSTRING}"'@members.3322.net/dyndns/update?hostname='"${DOMAIN}"'&myip='"${IPv4}" -k -o -
}

if [ ! "$*" ];then
    show_useage;exit 0 ;
fi

IPv6=''
IPv4=${IPv6}


while getopts ':ds:4:6:' OPT; do
    case $OPT in
        d)
            DELAY_SECONDS=$(shuf -i 1-60 -n 1)
            ;;
        s)
            ISP=$OPTARG
            ;;
        4)
            IPv4=$OPTARG
            ;;
        6)
            IPv6=$OPTARG
            ;;
        ?)
            show_useage;
            exit 0
            ;;
    esac
done
shift $((OPTIND - 1))

if function_exists ISP_"$ISP";then
    [[ $DELAY_SECONDS  -gt 0  ]]  && echo DELAY IN RAND "$DELAY_SECONDS" && sleep "$DELAY_SECONDS"
    ISP_"$ISP" "$@"
else
   echo Can not find Specified DDNS ISP: "$ISP"
   exit 1;
fi

exit 0;