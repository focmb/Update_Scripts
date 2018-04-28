# Content/Inhalt

* [Content/Inhalt](#contentinhalt)
   * [English README: Scripts for checking for updates](#scripts-for-checking-for-update)
   * [Deutsche README: Scripte für die Prüfung auf Updates](#scripte-für-die-prüfung-auf-updates)

# Scripts for checking for updates

This repository contains various scripts. Each script is responsible for the update check of a software on the Raspberry, but can of course also be used on other systems.

The repository currently includes the following scripts:

- **checkGogsVersion.sh** - Checking for new Gogs version (Dev-Branch) on Github
- **checkSeafileVersion.sh** - Checking for new Seafile version for Raspberry
- **checkGoLanguage.sh** - Checking for new version of GoLanguage for Raspberry
- **checkForUpdates.sh** - Checking for paket update for Raspbian
- **checkWallabagVersion.sh** - Checking for new Wallabagversion

All scripts are located on the Raspberry:

    /user/local/bin

and belong to the user ***root***. The scripts must of course be executable. A cron job can be created so that updates are checked regularly and automatically. An example for executing the scripts every 12 hours could look like this:

    0 */12 * * * /usr/local/bin/checkGogsVersion.sh >/dev/null 2>&1
    0 */12 * * * /usr/local/bin/checkSeafileVersion.sh >/dev/null 2>&1
    0 */12 * * * /usr/local/bin/checkGoLanguage.sh >/dev/null 2>&1
    0 */12 * * * /usr/local/bin/checkWallabagVersion.sh >/dev/null 2>&1

If a new software version is available on the server, the scripts send a message via pushbullet to the specified devices. To do this, you have to enter your own **API_KEY** from Pushbullet in the respective script.

Of course, the paths to the local installations must also be adapted accordingly.

# Scripte für die Prüfung auf Updates

Dieses Repository enthält verschiedene Scripte. Jedes Script ist für die Updateprüfung einer Software auf dem Raspberry verantwortlich, können natürlich aber auch auf anderen Systemen eingesetzt werden.

Zur Zeit umfasst das Repository folgende Scripte:

- **checkGogsVersion.sh** - Prüfung auf neue Gogs-Version (Dev-Branch) auf Github
- **checkSeafileVersion.sh** - Prüfung auf neue Seafile-Version für den Raspberry
- **checkGoLanguage.sh** - Prüfung auf eine neue Version von GoLanguage für den Raspberry
- **checkForUpdates.sh** - Prüfung auf Paketaktualisierungen für Raspbian
- **checkWallabagVersion.sh** - Prüfung auf neue Wallabag-Version

Alle Scripte liegen auf dem Raspberry unter:

    /user/local/bin

und gehören dem Benutzer ***root***. Die Scripte müssen natürlich ausführbar sein. Damit regelmäßig und automatisch auf Updates geprüft wird, kann ein Cron-Job angelegt werden. Ein Beispiel für eine Ausführung der Scripte alle 12 Stunden könnte so aussehen:

    0 */12 * * * /usr/local/bin/checkGogsVersion.sh >/dev/null 2>&1
    0 */12 * * * /usr/local/bin/checkSeafileVersion.sh >/dev/null 2>&1
    0 */12 * * * /usr/local/bin/checkGoLanguage.sh >/dev/null 2>&1
    0 */12 * * * /usr/local/bin/checkWallabagVersion.sh >/dev/null 2>&1

Die Scripte versenden bei Vorhandensein einer neuen Softwareversion auf dem Server eine Meldung per Pushbullet an die angegebenen Geräte. Dafür muss in dem jeweiligen Script noch der eigene **API_KEY** von Pushbullet eingetragen werden.

Natürlich müssen auch die Pfade zu den lokalen Installationen entsprechend angepasst werden.
