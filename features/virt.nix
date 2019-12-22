{ config, pkgs, lib, ... }:
{
  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;
  networking.firewall.checkReversePath = false;
  programs.dconf.enable = true;
}
