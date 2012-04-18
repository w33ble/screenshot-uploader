#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
API_KEY=`head -n1 ${DIR}/screenshot-api-key`

TYPE=jpg #png, jpg, gif, etc. | if you change this, be sure to change the quality
QUALITY=90 #image quality
FILE="$HOME/Desktop/screenshot-`date '+%Y-%m-%d-%N'`.${TYPE}"

case "$1" in
	-s|--selection)
		OPTIONS="-s -b -q ${QUALITY}"
		;;
	-a)
		OPTIONS="-q ${QUALITY}"
		;;
	*)
		echo "Usage: ${0} [-a|-s]"
		exit 1
esac

scrot ${OPTIONS} ${FILE}

#case "$2" in
#	-n|--noupload)
#		exit 0
#		;;
#	*)
		#curl -# -F "image"=@"${FILE}" -F "key"="${API_KEY}" http://api.imgur.com/2/upload.xml |\
		#	grep -Eo '<[a-z_]+>http[^<]+' |\
		#	sed 's/^<.\|_./\U&/g;s/_/ /;s/<\(.*\)>/\x1B[0;34m\1:\x1B[0m /'
		#TEXT=$(curl -F "image"=@"${FILE}" -F "key"="${API_KEY}" http://api.imgur.com/2/upload.xml | \
		#	grep -Eo '<[a-z_]+>http[^<]+' | \
		#	sed 's/^<.\|_./\U&/g;s/_/ /;s/<\(.*\)>/\1:\ /');
		LINK=$(curl -\# -F "image"=@"${FILE}" -F "key"="${API_KEY}" http://api.imgur.com/2/upload.xml | \
			grep -Eo '<[a-z_]+>http[^<]+' | \
			grep original | \
			sed 's/^<.*>//' );
		echo -n $LINK | xclip -selection clipboard
		exit 0
#		;;
#esac

