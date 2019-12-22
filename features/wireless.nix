{ config, pkgs, lib, ... }:
{
  networking.networkmanager = {
    enable = true;
    wifi.powersave = false;
  };
}
