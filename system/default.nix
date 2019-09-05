{ config, pkgs, lib, ... }:
{
  imports = [
    ./users.nix
    ./luks.nix
  ];

  system.autoUpgrade.enable = true;

  time.timeZone = "Europe/Paris";
  services.timesyncd.enable = true;
}
