#!/bin/bash

localfile="/home/leitzke/Downloads/wallabag/app/config/wallabag.yml"

# Get local version from wallabag.yml
if [ -f "$localfile" ]
    then
        while read line 
            do
                if [[ "$line" =~ "version" ]];
                    then
                        localVersion="$line"
                        break
                fi    
            done < "$localfile"
            IFS=" " read -r _ t2 <<< "$localVersion"
            localVersion="$t2"
fi

# Get online version from github
repo="wallabag/wallabag"
onlineVersion=$(curl --silent "https://api.github.com/repos/$repo/releases/latest"  | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')                                       
if ! [[ ${onlineVersion:0:1} = [[:digit:]] ]]
    then 
        onlineVersion=${onlineVersion:1}
fi

# Compare versions
if [ "$localVersion" != "$onlineVersion" ]
    then
        temp=$(echo -e "$localVersion\n$onlineVersion" | sort -V )
        IFS=" " read -r t1 _ <<< "$temp"
        if [ "$localVersion" = "$t1" ]
            then curl -k -u API_KEY https://api.pushbullet.com/v2/pushes -d type=note -d title="Neue Wallabag-Version online" -d body="Wallabag-Version $onlineVersion ist online (lokale Wallabag-Version: $localVersion" >/dev/null 2>&1
        fi
fi

