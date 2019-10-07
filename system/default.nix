{ config, pkgs, lib, ... }:
{
  imports = [
    ./users.nix
    ./luks.nix
    ./ssh.nix
  ];

  system.autoUpgrade.enable = true;

  boot.kernel.sysctl = {
    "kernel.perf_event_paranoid" = 1;
  };

  time.timeZone = "Europe/Paris";
  services.timesyncd.enable = true;
}
