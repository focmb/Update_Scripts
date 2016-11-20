#!/bin/bash

if [ -f /home/seafile/seafile-server-latest/seahub/seahub/settings.py ]
        then
                ## get information about local Seafileinstallation
                local_version=$(tail -n2 /home/seafile/seafile-server-latest/seahub/seahub/settings.py)
                t1=${local_version#*\"}
                local_version=${t1%\"*}
                # get information about remote seafile repo
                online_version=$(curl -s https://api.github.com/repos/haiwen/seafile-rpi/tags | tac | tac | head -n3 | grep name)
                IFS=" " read -r _ t2 <<< "$online_version"
                t2=${t2#*\"v}
                online_version=${t2%\"*}
                if [ "$local_version" != "$online_version" ]
                        then
                                temp=$(echo -e "$local_version\n$online_version" | sort -V )
                                IFS=" " read -r t1 _ <<< "$temp"
                                if [ "$local_version" = "$t1" ]
                                        then
                                                curl -s -k -u API_KEY https://api.pushbullet.com/v2/pushes -d type=note -d title="Neue Seafile-Version online" -d body="Seafile-Version $online_version ist online (lokale Seafile-Version: $local_version)" >/dev/null 2>&1
                                fi
                fi
fi
