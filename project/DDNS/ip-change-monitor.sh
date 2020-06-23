#!/bin/sh

function monitor_3322(){
    echo -n  $(curl -ssL -k http://ip.3322.net/ -o  -)
}

function monitor_httpbin(){
    curl -ssL -k http://httpbin.org/ip -o  - | grep origin |grep -oP '\d+\.\d+.\d+\.\d+'
}

function monitor_ipify(){
    curl -ssL -k https://api.ipify.org -o  -
}