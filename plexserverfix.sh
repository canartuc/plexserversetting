#!/usr/bin/env bash

MYGROUP="$USER"
echo "...Your usergroup= ${MYGROUP}"
sleep 1

echo "...Setting usermod to plex user using your usergroup"
sleep 1
sudo usermod -a -G $MYGROUP plex

echo "...Setting chown your usermod and usergroup"
sleep 1
sudo chown $USER:$MYGROUP /media/$USER

echo "...Setting chmod to user"
sleep 1
sudo chmod 750 /media/$USER

echo "...Setting setfacl to user"
sleep 1
sudo setfacl -m g:$MYGROUP:rwx /media/$USER

echo "...Restarting Plex Media Server to set latest changes"
sudo systemctl restart plexmediaserver
sleep 1

echo "(√√√) You are good to go! Enjoy!"
