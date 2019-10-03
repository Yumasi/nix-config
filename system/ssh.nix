{ config, pkgs, lib, ... }:
{
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    challengeResponseAuthentication = false;
  };
}
