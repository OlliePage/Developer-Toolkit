#!/bin/bash
# Builds build/WhichMac.app: one universal (Apple Silicon + Intel) binary, ad-hoc signed.
set -euo pipefail
cd "$(dirname "$0")"

APP=build/WhichMac.app
rm -rf "$APP" build/obj
mkdir -p "$APP/Contents/MacOS" build/obj

for arch in arm64 x86_64; do
    xcrun swiftc -O -target "$arch-apple-macos13.0" Sources/*.swift -o "build/obj/WhichMac-$arch"
done
lipo -create build/obj/WhichMac-arm64 build/obj/WhichMac-x86_64 -output "$APP/Contents/MacOS/WhichMac"
cp Resources/Info.plist "$APP/Contents/Info.plist"
codesign --force --sign - "$APP"

echo "Built $APP"
