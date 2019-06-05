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
Usage:  ${MY} [-d] -s duckdns DOMAIN TOKEN [IP]
        ${MY} [-d] -s pubyun AUTHSTRING(which is USERNAME:PASSWORD) DOMAIN [IP]

        -------ARGS-----------
        -d Enable random delay
EOF
}

ISP_duckdns(){
    DOMAIN=$1
    TOKEN=$2
    IP=$3
    curl -ssL 'https://www.duckdns.org/update?domains='"${DOMAIN}"'&token='"${TOKEN}"'&verbose=true&ip='"${IP}" -k -o -
}


ISP_pubyun(){
    AUTHSTRING=$1
    DOMAIN=$2
    IP=$3
    curl -ssL 'https://'"${AUTHSTRING}"'@members.3322.net/dyndns/update?hostname='"${DOMAIN}"'&myip='"${IP}" -k -o -
}

if [ ! "$*" ];then
    show_useage;exit 0 ;
fi

while getopts ':ds:' OPT; do
    case $OPT in
        d)
            DELAY_SECONDS=$(shuf -i 1-60 -n 1)
            ;;
        s)
            ISP=$OPTARG
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