{ config, pkgs, libs, ... }:
let
  sshKeys-XIII = import ./ssh/ssh-keys-XIII.nix;
in
{
  users.groups = { XIII = { }; };
  environment.pathsToLink = [ "/share/zsh" ];

  users.users.XIII = with pkgs; {
    description = "Guillaume Pagnoux";
    home = "/home/XIII";
    group = "XIII";
    extraGroups = [ "audio" "libvirtd" "users" "video" "wheel" ];
    isNormalUser = true;
    shell = zsh;
    uid = 1000;

    openssh.authorizedKeys.keys = sshKeys-XIII;
  };
}
