{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
    ./common.nix
  ];

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.gnome.gnome-keyring.enable = true;  

  qt.enable = true;
  qt.style = "adwaita";
  qt.platformTheme = "gnome";

  environment.systemPackages = with pkgs; [
    adw-gtk3   
  ];
}
