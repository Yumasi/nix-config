{ config, pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    layout = "us";

    desktopManager.default = "none";
    desktopManager.xterm.enable = false;

    displayManager.lightdm.greeters.mini = {
      enable = true;
      user = "XIII";
    };

    windowManager.default = "i3";
    windowManager.i3.enable = true;
  };

  services.xserver.autoRepeatDelay = 200;
  services.xserver.autoRepeatInterval = 60;
}
