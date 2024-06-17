{ lib, inputs, pkgs, config, ... }:

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
          enable = false;
        };
      };
    };
  };

  environment = {
    gnome.excludePackages = with pkgs; [
      epiphany
      gnome-tour
      gnome.yelp
      gnome.gnome-music
      gnome-console   
      gnome-text-editor
    ];
  };

  environment.systemPackages = with pkgs; [
    gnomecast
    qgnomeplatform-qt6
  ] ++ ( with pkgs.gnomeExtensions; [
    wallpaper-slideshow
    appindicator
    clipboard-indicator
    blur-my-shell
    forge
  ]);
    
   # Minimize how bad qt apps look here
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";
}
