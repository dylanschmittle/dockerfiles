#!/bin/sh
LATEST_VER=$(curl --silent "https://github.com/lensapp/lens/releases/latest"  | sed -E 's/.*"([^"]+)".*/\1/' | cut -d '/' -f8)
wget -q -L -O app.AppImage https://github.com/lensapp/lens/releases/download/$LATEST_VER/Lens-$(echo $LATEST_VER | tr -d 'v').AppImage
chmod +x app.AppImage
