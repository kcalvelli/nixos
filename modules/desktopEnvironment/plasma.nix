{ lib, pkgs, config, ... }:
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
  
      services = {
        displayManager = {
          sddm = {
            enable = true;
            wayland = {
              enable = true;
            };
          }; 
        };
      };
      
      services.desktopManager.plasma6.enable = true;   

      hardware.bluetooth.enable = true;
      networking.networkmanager.enable = true;
      hardware.pulseaudio.enable = true;
      services.colord.enable = true;
      services.power-profiles.enable = lib.mkForce true;


      programs.kdeconnect = {
        enable = true;
        package = lib.mkForce pkgs.kdePackages.kdeconnect-kde;
      };

      programs.chromium.enablePlasmaBrowserIntegration = true;      

      qt = {
        enable = true;
        platformTheme = "kde";
      };

      systemPackages = with pkgs; with kdePackages; [
        kaccounts-providers
        kaccounts-integration
        merkuro
      ];  
    };
  };
}
