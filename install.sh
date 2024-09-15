#!/usr/bin/env bash

#FIXIT: Fix install script.
USERNAME=$(whoami)
HOME_MANAGER_DIR="$HOME/.config/home-manager/"
HOME_MANAGER_FILE="$HOME_MANAGER_DIR/home.nix"
FLAKE_FILE="$HOME_MANAGER_DIR/flake.nix"

sed -i "s|homeConfigurations.\".*\" = home-manager.lib.homeManagerConfiguration {|homeConfigurations.\"$USERNAME\" = home-manager.lib.homeManagerConfiguration {|g" "$FLAKE_FILE"
sed -i "s|home.username = \".*\";|home.username = \"$USERNAME\";|g" "$HOME_MANAGER_FILE"
sed -i "s|home.homeDirectory = \".*\";|home.homeDirectory = \"/home/$USERNAME\";|g" "$HOME_MANAGER_FILE"
