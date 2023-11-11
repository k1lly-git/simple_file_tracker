#!/bin/bash

# CHANGE THIS
# ----------------------
LOCAL_USER="k1lly"
# ----------------------

MAIN_DIR="/opt/tracker"
LOGFILE="/var/log/tracker.log"
TIME_MASK="+[%Y-%m-%d %H:%M]"
DATE_VAR=$(date "$TIME_MASK")
SNAPSHOT="/opt/tracker/snap.txt"
SNAPSHOT_2="/opt/tracker/snap_2.txt"
DIFF_FILE="/opt/tracker/diff_files.txt"

checkDir()
{
if ! [ -d $MAIN_DIR ]
then
  mkdir $MAIN_DIR
fi
}

checkSnap()
{
if ! [ -f $SNAPSHOT ]
then
  find /home/$LOCAL_USER/ -printf "%p\n" 2> /dev/null > $SNAPSHOT
  # ls -Rd "/home/$LOCAL_USER/*" > $SNAPSHOT
fi
}

checkLog()
{
if ! [ -f $LOGFILE ]
then
  touch $LOGFILE
  echo "$DATE_VAR tracker.log created" >> $LOGFILE
  exit 0
fi
}

getDiffFiles()
{
  find /home/$LOCAL_USER/ -printf "%p\n" 2> /dev/null > $SNAPSHOT_2
  diff $SNAPSHOT $SNAPSHOT_2 | awk '/^>/' | awk '{ for (i=2; i<=NF; i++) printf "%s ", $i; printf "\n" }' > $DIFF_FILE
#  diff $SNAPSHOT $SNAPSHOT_2 | awk '/^>/' | awk '{ for (i=2; i<=NF; i++) printf "%s ", $i; printf "\n" }' | sort -u > $DIFF_FILE
#  diff $SNAPSHOT $SNAPSHOT_2 | awk '/^>/ { print $2}' | sort -u > $DIFF_FILE
}

# INIT
checkDir
checkSnap
checkLog

# SCRIPT
getDiffFiles

IFS=$'\n'
for str in $(cat $DIFF_FILE)
do
  echo "$DATE_VAR $str" >> $LOGFILE
done

rm $SNAPSHOT
mv $SNAPSHOT_2 $SNAPSHOT





