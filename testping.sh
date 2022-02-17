#!/bin/bash
while read HOSTS
do
        echo "The IP IS:" $HOSTS
        COUNT=4
        for myHost in $HOSTS
        do
          count=$(ping -c $COUNT $myHost | grep 'received' | awk -F',' '{ print $2 }' |
        awk '{ print $1 }')
          if [ $count -eq 0 ]; then
                # 100% failed
                echo "Host : $myHost is down (ping failed) at $(date)"
                echo "Host : $myHost is down (ping failed) at $(date)" >> result.txt
          fi
        done
done<ips.txt
