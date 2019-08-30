{ config, pkgs, libs, ... }:
{
  users.groups = { yumasi = { }; };

  users.users.yumasi = {
    description = "Guillaume Pagnoux";
    home = "/home/yumasi";
    group = "yumasi";
    extraGroups = [ "libvirtd" "users" "video" "wheel" ];
    isNormalUser = true;
  };
}
