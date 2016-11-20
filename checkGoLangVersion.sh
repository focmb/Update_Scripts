#!/bin/bash
# Check for new version of GoLanguage
workdir="/tmp"
cd "$workdir" || exit
wget https://raw.githubusercontent.com/meinside/rpi-configs/master/bin/prep_go.sh
if [ -f prep_go.sh ]
        then
                search="INSTALL_BRANCH.* tag"
                tmp_name=$(grep "$search" prep_go.sh)
                online_version=$(echo "$tmp_name" | grep -Po '(?<=go)[^\"]+')
                rm prep_go.sh
                if [ -d "/opt/go-go"* ]
                        then
                                local_version=$(ls /opt | grep go-go | cut -c 6-)
                                if [ "$local_version" != "$online_version" ]
                                        then
                                                temp=$(echo -e "$local_version\n$online_version" | sort -V )
                                                IFS=" " read -r t1 _ <<< "$temp"
                                                if [ "$local_version" = "$t1" ]
                                                        then
                                                                curl -s -k -u API_KEY https://api.pushbullet.com/v2/pushes -d type=note -d title="Neue GoLanguage-Version online" -d body="GoLanguage-Version $online_version ist online (lokale GoLanguage-Version: $local_version)" >/dev/null 2>&1
                                                fi
                                fi
                fi
fi
