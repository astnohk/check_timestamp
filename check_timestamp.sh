#!/bin/sh
#
# List the latest change files
#
# Search the files last n-days in ctime (change time)
#
#
# how to use:
#         ./check_timestamp.sh (days) (path to dir) (user)
#
# for example, list the last 3-days changed file in /home/username/ owned by user:
#         ./check_timestamp.sh 3 /home/username/ user

if [ $# -ge 3 ]; then
	USER_OPTION=$3
else
	USER_OPTION=
fi

if [ $# -ge 2 ]; then
	DAYS=$1
	DIR=$2
elif [ $# -ge 1 ]; then
	DAYS=$1
	DIR=.
else
	DAYS=5
	DIR=.
fi

set -x
find ${DIR} ${USER_OPTION} -ctime -${DAYS} -type f -exec stat --format="%z %n" {} \; | sort -n

