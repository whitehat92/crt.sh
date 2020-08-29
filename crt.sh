#!/bin/bash
curl -s https://crt.sh/?q=%.$1 | grep $1 | grep -i td | sed "s/<TD>//g" | sed "s/<BR>/\n/g" | sort -u | sed "s/<\/TD>//g" | sed 's/[[:blank:]]//g' | sort -u | httprobe -c 10 | sed 's/^http\(\|s\):\/\///g' | tee $1_scope_alive.txt
