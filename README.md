Description
===========
Bash script to upload screenshots to an image service and place the resulting URL in the clipboard

Requirements
============
This script makes use of the following:

- scrot (to grab the screenshot)
- curl (to upload)
- xclip (top copy link to cliboard)

On Ubuntu, these can be installed with the following:

> sudo apt-get install curl scrot xclip

Usage
=====
In order to use this script, you need an [API key](http://api.imgur.com/) from Imgur

Once you have a key, place it in to a file named *api_key* in the same directory as upload.sh. The following would work:

> echo "APIKEYHERE" > api_key

Then simply run *./upload.sh* to upload a screenshot of your entire screen, or *./upload.sh -s* to choose a selection of the screen to upload

When the upload is complete, the resulting URL will be placed in your clipboard, ready to paste anywhere you need it.

Limitations
===========
Currently limited to [Imgur](http://imgur.com)
