#!/bin/bash

# CHANGE THIS
# ----------------------
LOCAL_USER="k1lly"
# ----------------------

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
  find /home/$LOCAL_USER/ -printf "%p\n" 2> /dev/null > $SNAPSHOT
  # ls -Rd "/home/$LOCAL_USER/*" > $SNAPSHOT
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


# INIT
checkDir
checkSnap
checkLog






