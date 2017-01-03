#!/bin/bash

apt-get update > /dev/null 2>&1
apt-get upgrade -u -s -y > /dev/shm/output 2>&1
pakete=$(grep "^ " /dev/shm/output)
paketnum=$(grep '^[1-9]\{1\}* [aktualisiert|upgraded]' /dev/shm/output | awk '{print $1}')
if [ "$paketnum" != "" ]
        then
                curl -s -k -u PUSHBULLET_API_KEY https://api.pushbullet.com/v2/pushes -d type=note -d title="Rasberry Updates verfügbar" -d type=note -d title="Rasberry Updates verfügbar" -d body="$paketnum Pakete zum Aktualisieren:$pakete" >/dev/null 2>&1
fi
if [ -f /dev/shm/output ]
    then
        rm /dev/shm/output
fi
