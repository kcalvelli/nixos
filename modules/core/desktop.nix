{
  inputs,
  pkgs,
  config,
  utils,
  lib,
  ...
}:

{
  imports = [ inputs.nixos-cosmic.nixosModules.default ];

  #Cosmic
  services.desktopManager.cosmic.enable = true;
  #services.displayManager.cosmic-greeter.enable = true;

  #GNOME
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
  
  # Minimize how bad qt apps look here
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";

  environment.systemPackages = with pkgs; [
    adw-gtk3
    qgnomeplatform-qt6
    gnome-extension-manager
  ];
}