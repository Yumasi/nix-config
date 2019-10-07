{ config, pkgs, lib, ... }:
{
  imports = [
    ../features/ccache.nix
    ../features/virt.nix
    ../features/weechat.nix
    ../features/x11.nix
  ];

  # I don't care about mitigations in a VM
  boot.kernelParams = [ "mitigations=off" ];

  hardware = {
    pulseaudio.enable = true;
  };
}
