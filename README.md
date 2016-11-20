# Scripte für die Prüfung auf Updates

Dieses Repository enthält verschiedene Scripte. Jedes Script ist für die Updateprüfung einer Software auf dem Raspberry verantwortlich, können natürlich aber auch auf anderen Systemen eingesetzt werden.

Zur Zeit umfasst das Repository folgende Scripte:

- **checkGogsVersion.sh** - Prüfung auf neue Gogs-Version (Dev-Branch) auf Github
- **checkSeafileVersion.sh** - Prüfung auf neue Deafile-Version für den Raspberry

Alle Scripte liegen auf dem Raspberry unter:

    /user/local/bin

und gehören dem Benutzer ***root***. Die Scripte müssen natürlich ausführbar sein. Damit regelmäßig und automatisch auf Updates geprüft wird, kann ein Cron-Job angelegt werden. Ein Beispiel für eine Ausführung der Scripte alle 12 Stunden könnte so aussehen:

    0 */12 * * * /usr/local/bin/checkGogsVersion.sh >/dev/null 2>&1
    0 */12 * * * /usr/local/bin/checkSeafileVersion.sh >/dev/null 2>&1

Die Scripte versenden bei Vorhandensein einer neuen Softwareversion auf dem Server eine Meldung per Pushbullet an die angegebenen Geräte. Dafür muss in dem jeweiligen Script noch der eigene **API_KEY** von Pushbullet einegtragen werden. 

Natürlich müssen auch die Pfade zu den lokalen Installationen entsprechend angepasst werden.
