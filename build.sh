#!/usr/bin/env bash

set -e
SCR_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "Building..."
pushd "$SCR_DIR" > /dev/null

if [ ! -f "$SCR_DIR/configuration.nix" ]; then
    echo "Error: There is no configuration.nix in your directory!"
    popd > /dev/null
    exit 1
fi

if sudo nixos-rebuild switch -I nixos-config="./configuration.nix"; then
    CURRENT_GEN=$(nixos-rebuild list-generations | grep current | awk '{print $1}')
    echo "Done: New generation: No$CURRENT_GEN"
else
    echo "Error: Build failed!"
    popd > /dev/null
    exit 1
fi

popd > /dev/null