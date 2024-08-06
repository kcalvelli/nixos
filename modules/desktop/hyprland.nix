{ pkgs, inputs, config, lib, ... }:
let
  pkgs-hyprland = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  
  options.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };
  
  config = lib.mkIf config.hyprland.enable {
    programs = {
      hyprland = {
        enable = true;
        package = pkgs-hyprland.hyprland;
        xwayland.enable = true;
        portalPackage = pkgs-hyprland.xdg-desktop-portal-hyprland;
      };
      hyprlock.enable = true;
    };

    services = {
      hypridle.enable = true;
    };


    security = {
      pam.services.ags = {};
      pam.services.hyprlock = {};
    };    


  
    environment = { 
      systemPackages = with pkgs;
      [
        morewaita-icon-theme
        wl-gammactl
        wl-clipboard
        brightnessctl
        swww   
        nwg-drawer     
        grim
        playerctl
      ];    
    };

    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = ["graphical-session.target"];
        wants = ["graphical-session.target"];
        after = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    }; 
  };        
}
