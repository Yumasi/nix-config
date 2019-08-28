{ config, pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    layout = "us";

    desktopManager.default = "none";
    desktopManager.xterm.enable = false;

    displayManager.lightdm.greeters.enso.enable = true;

    windowManager.default = "i3";
    windowManager.i3.enable = true;
  };
}