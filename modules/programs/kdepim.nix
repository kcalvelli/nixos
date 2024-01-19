{
  config,
  lib,
  pkgs,
  utils,
  ...
}: let 
  inherit (pkgs) kdePackages;
  inherit (lib) literalExpression mkDefault mkIf mkOption mkPackageOptionMD tyles;
in {
  options = {
    programs.kdepim = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable KDE PIM";
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs.kdePackages; [
     kmail
     kmail-account-wizard
     kmailtransport

     merkuro
     kleopatra
     bogofilter

     calendarsupport
     akonadi-calendar
     akonadi-calendar-tools
     akonadi-contacts
     akonadi-import-wizard
     akonadi-mime
     akonadiconsole
     akonadi-notes
     akonadi-search
     akonadi
     kdepim-addons
     kdepim-runtime
    ];
  };
}