{ inputs, config, pkgs, ... }:

{  
  # Enable flatpak
  services.flatpak.enable = true;

  services.flatpak.packages = [
    "com.spotify.Client"
  ];

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly"; # Default value
  };
}