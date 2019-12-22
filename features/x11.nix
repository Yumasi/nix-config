{ config, pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    layout = "us";

    desktopManager.xterm.enable = false;

    displayManager.defaultSession = "none+i3";
    displayManager.lightdm.greeters.mini = {
      enable = true;
      user = "yumasi";
    };

    windowManager.i3.enable = true;
  };

  services.xserver.autoRepeatDelay = 200;
  services.xserver.autoRepeatInterval = 60;
}
