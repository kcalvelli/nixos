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
      xserver.displayManager.startx.enable = true;

      gvfs.enable = true;
      devmon.enable = true;
      udisks2.enable = true;
      upower.enable = true;
      power-profiles-daemon.enable = true;
      accounts-daemon.enable = true;
      gnome = {
        evolution-data-server.enable = true;
        glib-networking.enable = true;
        gnome-keyring.enable = true;
        gnome-online-accounts.enable = true;
        tracker-miners.enable = true;
        tracker.enable = true;
      };      

    };

    xdg.portal = {
      enable = true;
    };

    security = {
      polkit.enable = true;
      pam.services.ags = {};
    };    

    # Minimize how bad qt apps look
    qt.enable = true;
    qt.style = "adwaita-dark";
    qt.platformTheme = "gnome";
  
    environment = { 
      systemPackages = with pkgs;
      [
        morewaita-icon-theme
        gnome-calendar
        gnome.gnome-boxes
        gnome.gnome-control-center
        gnome.gnome-weather
        gnome-calculator
        gnome.gnome-clocks
        seahorse
        nautilus
        baobab
        wl-gammactl
        wl-clipboard
        brightnessctl
        swww
        adw-gtk3
        qgnomeplatform-qt6
        qadwaitadecorations
        qadwaitadecorations-qt6    
        nwg-dock-hyprland
        nwg-drawer     
        blueberry   
        networkmanagerapplet
    ];    
      sessionVariables = {
        QT_WAYLAND_DECORATION = "adwaita";
      };
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
