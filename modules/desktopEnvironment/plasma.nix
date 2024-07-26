{ lib, pkgs, ... }:
{
  imports = [
    ./gnome.nix
    ./cosmic.nix
  ];

  options.plasma = {
    enable = lib.mkEnableOption "Plasma";
  };

  config = lib.mkIf config.plasma.enable {  
    specialisation.plasma.configuration = {
      cosmic.enable = lib.mkForce false;
      gnome.enable = lib.mkForce false;
  
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;    
    };
  };
}