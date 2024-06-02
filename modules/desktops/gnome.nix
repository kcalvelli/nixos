{ inputs, pkgs, config, ... }:

{
  #Just gnome DE
  services = {
    xserver = {
      enable = true;
      excludePackages = [ xterm ];
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
    };
  };

  environment = {
    gnome.excludePackages = with pkgs; [
      epiphany
      evince
      gnome-connections
      gnome.geary
      gnome.gnome-calendar
      gnome.gnome-characters
      gnome.gnome-clocks
      gnome.gnome-contacts
      gnome.gnome-font-viewer
      gnome.gnome-maps
      gnome.gnome-music
      gnome.simple-scan
      gnome-tour
      gnome.yelp
      snapshot
    ];
  };
    
   # Minimize how bad qt apps look here
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";
}
