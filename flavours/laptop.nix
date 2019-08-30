{ config, pkgs, lib, ... }:
{
  imports = [
    ../features/x11.nix
    ../features/virt.nix
    ../features/wireless.nix
  ];

  # I don't care about mitigations in a VM
  boot.kernelParams = [ "mitigations=off" ];

  hardware = {
    pulseaudio.enable = true;
  };

  services.xserver.dpi = 192;
  fonts.fontconfig.dpi = 192;
  services.xserver.libinput.enable = true;
  services.xserver.libinput.naturalScrolling = true;
}
