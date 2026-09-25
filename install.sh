#!/bin/bash
# Builds WhichMac, replaces any installed copy in /Applications, launches it and turns on Open at Login.
# Safe to run again.
set -euo pipefail
cd "$(dirname "$0")"

./build.sh

# Quit a running copy so the new one launches fresh instead of `open` re-activating the old one.
if pgrep -x WhichMac >/dev/null; then
    pkill -x WhichMac
    for _ in {1..50}; do
        pgrep -x WhichMac >/dev/null || break
        sleep 0.1
    done
    pkill -9 -x WhichMac 2>/dev/null || true
fi

rm -rf /Applications/WhichMac.app
cp -R build/WhichMac.app /Applications/
open /Applications/WhichMac.app --args --enable-login-item

echo "Installed. ⌘-drag the name to the left end of the menu bar icons to place it."
