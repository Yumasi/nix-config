{ config, pkgs, lib, ... }:
{
  imports = [
    ../features/ccache.nix
    ../features/virt.nix
    ../features/wireless.nix
    ../features/x11.nix
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
  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.deviceSection = ''
      Option "DRI" "2"
      Option "TearFree" "true"
  '';

  services.autorandr.enable = true;

  programs.light.enable = true;
}
