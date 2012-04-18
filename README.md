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

Once you have a key, place it in to a file named *screenshot-api-key* in the same directory as screenshot-upload.sh. The following would work:

> echo "APIKEYHERE" > screenshot-api-key

Then run

> ./screenshot-upload.sh

And you'll get some usage instructions. You must choose -a (whole screen) or -s (selection) and optionally -n (don't upload, save to desktop instead)

When the upload is complete, the resulting URL will be placed in your clipboard, ready to paste anywhere you need it.

Limitations
===========
Currently limited to [Imgur](http://imgur.com)
