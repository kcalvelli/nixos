{ lib, pkgs, config, ... }:
with lib;                      
let
  cfg = config.programs.kdepim;
in {
  options = {
    programs.kdepim = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = lib.mdDoc "Enable the Plasma 6 PIM suite";
      };
    };
  };

  # Define what other settings, services and resources should be active IF
  # a user of this "hello.nix" module ENABLED this module 
  # by setting "services.hello.enable = true;".
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      bogofilter
      ] ++ ( with pkgs.kdePackages; [
      #kdepim
      pkgs.kdePackages.kmail
      pkgs.kdePackages.kmail-account-wizard
      pkgs.kdePackages.kmailtransport
 
      pkgs.kdePackages.merkuro
      pkgs.kdePackages.kleopatra
 
      pkgs.kdePackages.calendarsupport
      pkgs.kdePackages.akonadi-calendar
      pkgs.kdePackages.akonadi-calendar-tools
      pkgs.kdePackages.akonadi-contacts
      pkgs.kdePackages.akonadi-import-wizard
      pkgs.kdePackages.akonadi-mime
      pkgs.kdePackages.akonadiconsole
      pkgs.kdePackages.akonadi-notes
      pkgs.kdePackages.akonadi-search
      pkgs.kdePackages.akonadi
      pkgs.kdePackages.kdepim-addons
      pkgs.kdePackages.kdepim-runtime
    ]);
  };
}
