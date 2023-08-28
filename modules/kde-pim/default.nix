{config, pkgs, lib,...}: 
{
  #nixpkgs.config.packageOverrides = super: let self = super.pkgs; in {
  #  # For Akonadi with postgres
  #  postgresSupport = true;
  #  defaultDriver = "POSTGRES";
  #};   

  environment.systemPackages = with pkgs; [
    kmail
    ] ++ ( with pkgs.libsForQt5; [
    akonadi
    akonadiconsole
    akonadi-search
    kdepim-addons
    merkuro
    kdepim-addons
    kleopatra
    kdepim-runtime
    calendarsupport
  ] );

  environment.sessionVariables = {
    NIX_PROFILES = "${lib.concatStringsSep " " (lib.reverseList config.environment.profiles)}";
  };
}
