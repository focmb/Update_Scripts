#!/bin/bash

# get the current Gogs version of the development branch from Github

workdir="/tmp"
cd "$workdir" || exit
wget https://raw.githubusercontent.com/gogits/gogs/develop/templates/.VERSION
online_version=$(head -n1 $workdir/.VERSION | tail -n1)
if [ -f $workdir/.VERSION ]
    then
        rm $workdir/.VERSION
fi

localPath="/home/gogs/gogs/src/github.com/gogits/gogs/templates/.VERSION"

if [ -f "$localPath" ]
	then
		local_version=$(head -n1 "$localPath" | tail -n1)
		if [ "$local_version" != "$online_version" ]
    			then
        			temp=$(echo -e "$local_version\n$online_version" | sort -V )
        			IFS=" " read -r t1 _ <<< "$temp"
        			if [ "$local_version" = "$t1" ]
            				then curl -k -u API_KEY https://api.pushbullet.com/v2/pushes -d type=note -d title="Neue Gogs-Version online" -d body="Gogs-Version $online_version ist online (lokale Gos-Version: $local_version" >/dev/null 2>&1
        			fi
		fi
fi
