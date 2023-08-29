#!/bin/bash
#script name: ipcheck.sh
#author: 
#version: v1
#date: 2023-03-12

##定义
>UP_IP_LIST
>DOWN_IP_LIST

c_class='10.64.8'

echo "IP lsit  is start!! "

for ((i=0;i<255;i++))
do
  IP=$c_class'.'$i
  echo "IP  is $IP"
  
  sleep 5s 
  ping -c 3 -i 0.2 -w 3 $IP &>/dev/null #-c 3 ping3次主机 -i 0.2ping主机间隔 -w 3ping主机超时间隔
  if [ $? -eq 0 ];then
  echo "host $IP is up"
  echo -e "$IP" >>UP_IP_LIST
  else 
  echo "host $IP is down"
  echo -e "$IP" >>DOWN_IP_LIST
  fi
done

echo "IP lsit  is end!! "