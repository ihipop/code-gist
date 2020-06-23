#!/bin/bash
# https://blog.ihipop.info/2019/08/5222.html
name=$(openssl x509 -inform DER -subject_hash_old -in $1  |head -1).0
openssl x509 -inform DER -in $1 -out $name
openssl x509 -inform DER -text -in $1 -noout >>$name
readlink -f $name
echo done