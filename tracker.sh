#!/bin/bash

MAIN_DIR="/opt/tracker"
SNAPSHOT="/opt/tracker/snap.txt"
LOGFILE="/var/log/tracker.log"
TIME_MASK="+[%Y-%m-%d %H:%M]"

checkDir()
{
if ! [ -d $MAIN_DIR ]
then
  mkdir $MAIN_DIR
  echo "[+] $MAIN_DIR created"
else
  echo "[+] $MAIN_DIR found"
fi
}

checkSnap()
{
if ! [ -f $SNAPSHOT ]
then
  ls -R "/home/k1lly" > $SNAPSHOT
  echo "[+] $SNAPSHOT created"
else
  echo "[+] $SNAPSHOT found"
fi
}

checkLog()
{
if ! [ -f $LOGFILE ]
then
  touch $LOGFILE
  DATE_VAR=$(date "$TIME_MASK")
  echo "$DATE_VAR tracker.log created" >> $LOGFILE
  echo "[+] $LOGFILE created"
else
  echo "[+] $LOGFILE found"
fi
}



checkDir
checkSnap
checkLog




