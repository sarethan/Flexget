#!/usr/local/bin/bash
torrentid=$1
torrentname=$2
torrentpath=$3
echo "Torrent Complete: " $torrentname $torrentpath $torrentid  >> /home/deluge/.flexget/bin/execute_script.txt
/usr/local/bin/python2.7 /home/deluge/.flexget/bin/deluge_torrent_complete $1 $2 $3
