#!/bin/bash
# Rulează verible-verilog-lint pe toate fișierele .v din repo
ROOT="$(cd "$(dirname "$0")" && pwd)"

find "$ROOT" -name "*.v" | sort | while read -r file; do
    echo "--- $file"
    verible-verilog-lint "$file"
done
