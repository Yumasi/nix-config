{ config, pkgs, libs, ... }:
{
  users.groups = { yumasi = { }; };
  environment.pathsToLink = [ "/share/zsh" ];

  users.users.yumasi = with pkgs; {
    description = "Guillaume Pagnoux";
    home = "/home/yumasi";
    group = "yumasi";
    extraGroups = [ "libvirtd" "users" "video" "wheel" ];
    isNormalUser = true;
    shell = zsh;
    uid = 1000;
  };
}
