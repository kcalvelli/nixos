{ inputs, config, pkgs, ... }:
{ 
  imports = [
    ../../desktop
  ];

  services = {
    xserver = {
      displayManager = {
        gdm.enable = true;
      };
      
      desktopManager.gnome.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [ gnomeExtensions.appindicator ];
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
}