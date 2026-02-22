#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Building..."

if sudo nixos-rebuild switch -I nixos-config="$SCRIPT_DIR/configuration.nix" > /dev/null; then
    echo "Done!"
else
    echo ""
    echo "Error: Something went wrong while trying to build your system!"
    exit 1
fi