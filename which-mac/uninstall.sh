#!/bin/bash
# Turns off Open at Login, quits WhichMac and removes it from /Applications.
set -euo pipefail

APP=/Applications/WhichMac.app

pkill -x WhichMac 2>/dev/null || true
if [ -d "$APP" ]; then
    # Launch the installed copy once so it unregisters its own login item; it quits straight away.
    open -W -n "$APP" --args --disable-login-item
    rm -rf "$APP"
fi

echo "WhichMac removed."
