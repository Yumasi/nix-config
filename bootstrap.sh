#!/usr/bin/env bash

set -e

# Options
ROOT_PREFIX='/mnt'
USERNAME='XIII'

# Internal variables

NIX_CONFIG="/etc/nixos"
USER_HOME="/home/${USERNAME}"
REPO_DIRECTORY="${USER_HOME}/repo/nix-config"

LUKS_ID="$(blkid|grep "LUKS"|cut -d'"' -f2)"

BOLD_BLUE='\e[0;1;34m'
BOLD_GREEN='\e[0;1;32m'
BOLD_RED='\e[0;1;31m'

RESET='\e[0m'

# Utilities

warn() {
    echo -e "${BOLD_RED}$1${RESET}"
}

info() {
    echo -e "${BOLD_BLUE}$1${RESET}"
}

success() {
    echo -e "${BOLD_GREEN}$1${RESET}"
}

# Installation helpers

check_root_user() {
    if [ "$(id -u)" -ne 0 ]; then
        warn "This script must be run as root."
        exit 1
    fi
}

create_home_directory() {
    info "[+] Creating user home directory"
    info "[+] Creating user repo directory"
    info "[+] Creating config directory"
    mkdir -p "${ROOT_PREFIX}/${REPO_DIRECTORY}"
}

fetch_config() {
    info "[+] Fetching configuration from Github"
    curl -L https://github.com/Yumasi/nix-config/tarball/master | tar xz --strip-components=1 -C "${ROOT_PREFIX}/${REPO_DIRECTORY}" --wildcards 'Yumasi-nix-config-*/'
    success "[+] Succesfully fetched configuration from Github!"
}

install_config() {
    info "[+] Create symlink to /etc/nixos"
    mkdir -p "${ROOT_PREFIX}/etc"
    ln -srv "${ROOT_PREFIX}/${REPO_DIRECTORY}" "${ROOT_PREFIX}/${NIX_CONFIG}"
    info "[+] Generating hardware-configuration"
    nixos-generate-config --root "${ROOT_PREFIX}" --show-hardware-config > "${ROOT_PREFIX}/${NIX_CONFIG}/hardware-configuration.nix"


    read -p "Do you want to edit the configuration file ? " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        vim "${ROOT_PREFIX}/${NIX_CONFIG}/config"
    fi

    luks_setup
}

luks_setup() {
    local HOSTNAME
    local LUKS_LINE
    local DEST_FILE

    DEST_FILE="${ROOT_PREFIX}/${NIX_CONFIG}/system/luks.nix"
    printf '{ config, lib, pkgs, ... }:\n\n{\n' > "${DEST_FILE}"

    if [ -n "$LUKS_ID" ]; then
        info "[+] Generating luks.nix"
        HOSTNAME=$(cat "${ROOT_PREFIX}/${NIX_CONFIG}/config"|grep 'hostName ='|cut -d'"' -f2)
        LUKS_LINE="  boot.initrd.luks.devices.\"${HOSTNAME}\".device = \"/dev/disk/by-uuid/${LUKS_ID}\";"

        echo "${LUKS_LINE}" >> "${DEST_FILE}"
    fi
    echo '}' >> "${DEST_FILE}"
}

check_root_user

info "[+] Starting nixOS bootstrap."
create_home_directory
fetch_config
install_config
nixos-install
