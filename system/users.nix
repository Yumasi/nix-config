{ config, pkgs, libs, ... }:
{
  users.groups = { yumasi = { }; };

  users.users.yumasi = {
    description = "Guillaume Pagnoux";
    home = "/home/yumasi";
    group = "yumasi";
    extraGroups = [ "users" "wheel" ];
    isNormalUser = true;
  };
}
