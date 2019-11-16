{ config, pkgs, lib, ... }:
{
  containers.hydra = {
      autoStart = true;
      config = { config, pkgs, lib, ... }:
      let
        sshKeys-yumasi = import ../system/ssh/ssh-keys-yumasi.nix;
      in
      {
        services.hydra = {
          enable = true;
          hydraURL = "http://localhost:3000";
          notificationSender = "hydra@localhost";
          buildMachinesFiles = [];
          useSubstitutes = true;
        };
      };
    };
}
