#!/bin/bash
# header that should be given to all the Bash script
# after the first line; anywhere you see hash symbol # will begin the start of comments like this one

# Cleanup

LOG_DIR=/var/log          # defining variables are important and better than hard-coded values
ROOT_UID=0                # only users with $UID 0 have the root privileges as like administrator
LINES=50                  # default no. of lines saved
E_XCD=86                  # Can't change directory?
E_NOTROOT=87              # Non-root exit error

# check to see if user has root privilege
if [ "$UID" -ne "$ROOT_UID"   ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT


cd $LOG_DIR

cat /dev/null > messages
cat /dev/null > wtmp

echo "Logs cleaned up"
# echo command is like the cout , print commands

exit 0

# proper way to "exiting" the script
