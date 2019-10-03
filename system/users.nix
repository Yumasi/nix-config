{ config, pkgs, libs, ... }:
let
  sshKeys-yumasi = import ./ssh/ssh-keys-yumasi.nix;
in
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

    openssh.authorizedKeys.keys = sshKeys-yumasi;
  };
}
