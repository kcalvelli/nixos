{ inputs, pkgs, config, ... }:

{
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
      displayManager = {
        gdm = {
          enable = true;
        };
      };
    };
  };

  environment = {
    gnome.excludePackages = with pkgs; [
      epiphany
      gnome.geary
      gnome-tour
      gnome.yelp
      gnome.gnome-music
      gnome-console   
      gnome-text-editor
    ];
  };

  environment.systemPackages = with pkgs.gnomeExtensions; [
    wallpaper-slideshow
    gsconnect
    just-perfection
    appindicator
    blur-my-shell
    clipboard-indicator
    forge
    media-controls
    dash-to-dock
  ];
    
   # Minimize how bad qt apps look here
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";
}
