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

#      gvfs.enable = true;
      devmon.enable = true;
#      udisks2.enable = true;
#      upower.enable = true;
#      power-profiles-daemon.enable = true;
#      accounts-daemon.enable = true;
#      gnome = {
#        evolution-data-server.enable = true;
#        glib-networking.enable = true;
#        gnome-keyring.enable = true;
#        gnome-online-accounts.enable = true;
#        tracker-miners.enable = true;
#        tracker.enable = true;
      };      
      #greetd = {
      #  enable = true;
      #  settings.default_session.command = pkgs.writeShellScript "greeter" ''
      #    export XKB_DEFAULT_LAYOUT=${config.services.xserver.xkb.layout}
      #    export XCURSOR_THEME=Qogir
      #    ${asztal}/bin/greeter
      #  '';
      #};      


    #systemd.tmpfiles.rules = [
    #  "d '/var/cache/greeter' - greeter greeter - -"
    #];    

 #   system.activationScripts.wallpaper = let
 #     wp = pkgs.writeShellScript "wp" ''
 #       CACHE="/var/cache/greeter"
 #       OPTS="$CACHE/options.json"
 #       HOME="/home/$(find /home -maxdepth 1 -printf '%f\n' | tail -n 1)"
#
#        mkdir -p "$CACHE"
#        chown greeter:greeter $CACHE
#
#        if [[ -f "$HOME/.cache/ags/options.json" ]]; then
#          cp $HOME/.cache/ags/options.json $OPTS
#          chown greeter:greeter $OPTS
#        fi
#
#        if [[ -f "$HOME/.config/background" ]]; then
#          cp "$HOME/.config/background" $CACHE/background
#          chown greeter:greeter "$CACHE/background"
#        fi
#      '';
#    in
#      builtins.readFile wp;

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
        with gnome; [
          morewaita-icon-theme
    #     adwaita-icon-theme
          qogir-icon-theme
    #     loupe
    #     nautilus
    #     baobab
    #     gnome-text-editor
    #     gnome-calendar
    #     gnome-boxes
    #     gnome-system-monitor
    #     gnome-control-center
    #     gnome-weather
    #     gnome-calculator
    #     gnome-clocks
    #     gnome-software # for flatpak
         wl-gammactl
         wl-clipboard
         wayshot
         pavucontrol
         brightnessctl
         swww
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
