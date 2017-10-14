#!/usr/bin/env bash
# Install Google Chrome
# https://askubuntu.com/questions/79280/how-to-install-chrome-browser-properly-via-command-line
apt-get update
apt-get install wget
apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome*.deb  # Might show "errors", fixed by next line
apt-get install -f

# Install Node Stable (v7)
apt-get install build-essential 
apt-get install curl
curl -sL https://deb.nodesource.com/setup_7.x | bash -
apt-get install -y nodejs
# Run Chrome as background process
# https://chromium.googlesource.com/chromium/src/+/lkgr/headless/README.md
# --disable-gpu currently required, see link above
google-chrome --headless --no-sandbox --hide-scrollbars --remote-debugging-port=9222 --disable-gpu &

# Install script dependencies
npm install chrome-remote-interface minimist

# Take the screenshot
echo "website $1"
nodejs index.js  --outputDir=/var/output/ "$@"
