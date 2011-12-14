#!/bin/bash
API_KEY=`head -n1 api_key`

TYPE=jpg #png, jpg, gif, etc. | if you change this, be sure to change the quality
QUALITY=90 #image quality
FILE="$HOME/Desktop/screenshot-`date '+%Y-%m-%d-%N'`.${TYPE}"

case "$1" in
	-s|--selection)
		OPTIONS="-s -b -q ${QUALITY}"
		;;
	*)
		OPTIONS="-q ${QUALITY}"
		;;
esac

scrot ${OPTIONS} ${FILE}
#curl -# -F "image"=@"${FILE}" -F "key"="${API_KEY}" http://api.imgur.com/2/upload.json
#curl -# -F "image"=@"${FILE}" -F "key"="${API_KEY}" http://api.imgur.com/2/upload.xml
#curl -# -F "image"=@"${FILE}" -F "key"="${API_KEY}" http://api.imgur.com/2/upload.xml |\
#	grep -Eo '<[a-z_]+>http[^<]+' |\
#	sed 's/^<.\|_./\U&/g;s/_/ /;s/<\(.*\)>/\x1B[0;34m\1:\x1B[0m /'
#TEXT=$(curl -F "image"=@"${FILE}" -F "key"="${API_KEY}" http://api.imgur.com/2/upload.xml | \
#	grep -Eo '<[a-z_]+>http[^<]+' | \
#	sed 's/^<.\|_./\U&/g;s/_/ /;s/<\(.*\)>/\1:\ /');
LINK=$(curl -F "image"=@"${FILE}" -F "key"="${API_KEY}" http://api.imgur.com/2/upload.xml | \
	grep -Eo '<[a-z_]+>http[^<]+' | \
	grep original | \
	sed 's/^<.*>//' );
echo -n $LINK | xclip -selection clipboard
exit 0

