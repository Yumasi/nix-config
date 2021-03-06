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
    extraGroups = [ "audio" "libvirtd" "users" "video" "wheel" "docker" ];
    isNormalUser = true;
    shell = zsh;
    uid = 1000;

    openssh.authorizedKeys.keys = sshKeys-yumasi;
  };
}
