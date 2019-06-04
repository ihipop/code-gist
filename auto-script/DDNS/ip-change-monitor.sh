#!/bin/sh

function monitor_3322(){
    curl -ssL -k http://ip.3322.net/ -o  -
}

function monitor_httpbin(){
    curl -ssL -k http://httpbin.org/ip -o  - | grep origin |cut -d , -f 2|tr -d ' "' 
}

function monitor_ipify(){
    curl -ssL -k https://api.ipify.org -o  -
}