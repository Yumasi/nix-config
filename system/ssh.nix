{ config, pkgs, lib, ... }:
{
  services.openssh = {
    enable = true;
    forwardX11 = true;
    passwordAuthentication = false;
    challengeResponseAuthentication = false;
  };
}
