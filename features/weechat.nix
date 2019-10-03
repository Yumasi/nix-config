{ config, lib, pkgs, ... }:

{
  services.weechat.enable = true;
  programs.screen.screenrc = ''
                                multiuser on
                                acladd yumasi
                             '';
}
