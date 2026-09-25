#!/bin/bash
# Compiles the name-formatting logic together with its tests and runs them.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p build
xcrun swiftc Sources/NameFormatting.swift Sources/LoginItemPolicy.swift Tests/main.swift -o build/name-tests
./build/name-tests
