{ config, pkgs, ... }:

let
  build_settings = import ./config;

  flavour = ./flavours + "/${build_settings.flavour}.nix";
  hostName = build_settings.hostName;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      flavour
      ./system
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = hostName;

  environment.systemPackages = with pkgs; [
    git
    htop
    mosh
    pciutils
    tmux
    vim
  ];

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
