#!/bin/bash

repo="go-gitea/gitea"
localURL="https://gitea.meowclown.de"

#get online version from github repo
onlineVersion=$(curl --silent "https://api.github.com/repos/$repo/releases/latest" |  
    grep '"tag_name":' |                                                
    sed -E 's/.*"([^"]+)".*/\1/')                                       
if ! [[ ${onlineVersion:0:1} = [[:digit:]] ]]
    then onlineVersion=${onlineVersion:1}
fi

#get local version (from local webseite)
content=$(echo -e `wget -q -O - $localURL` | grep 'Gitea Version')
localVersion=$(echo $content | sed -e 's/^\(.*\)\(Gitea  *Version:  *[0-9\.]\{1,\}\)\( .*\)$/\2/' -e 's/Gitea  *Version:  *//')

if [ "$localVersion" != "$onlineVersion" ]
    then
        temp=$(echo -e "$localVersion\n$onlineVersion" | sort -V )
        IFS=" " read -r t1 _ <<< "$temp"
        if [ "$localVersion" = "$t1" ]
            then curl -k -u API_KEY https://api.pushbullet.com/v2/pushes -d type=note -d title="Neue Gitea-Version online" -d body="Gitea-Version $onlineVersion ist online (lokale Gitea-Version: $localVersion" >/dev/null 2>&1
        fi
fi