{ inputs, config, pkgs, ... }:

{  
  # Enable flatpak
  services.flatpak.enable = true;

  services.flatpak.packages = [
    "com.spotify.Client"
  ];
}