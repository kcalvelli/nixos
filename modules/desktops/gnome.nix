{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
    ./common.nix
  ];

  #Use gnome, but not gdm
  services.desktopManager.gnome.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

   # Minimize how bad qt apps look here
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";
}