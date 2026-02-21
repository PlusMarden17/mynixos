#!/usr/bin/env bash

DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
FILE="$SCRIPT_DIR/configuration.nix"

if [[ ! -f "$FILE" ]]; then
    echo "Error: There is no configuration.nix in project's folder..."
    echo "Expected path: $FILE"
    exit 1  
fi

echo "Building..."

if sudo nixos-rebuild switch -I nixos-config="$CONFIG_FILE" > /dev/null; then
    echo "Done!"
else
    echo "Error: Something went wrong while trying to build your system!"
    exit 1
fi