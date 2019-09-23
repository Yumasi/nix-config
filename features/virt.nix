{ config, pkgs, lib, ... }:
{
  virtualisation.libvirtd.enable = true;
  networking.firewall.checkReversePath = false;
}
