{ config, pkgs, lib, ... }:
{
  imports = [
    ../features/x11.nix
  ];
  # I don't care about mitigations in a VM
  boot.kernelParams = [ "mitigations=off" ];

  hardware = {
    pulseaudio.enable = true;
  };
}
