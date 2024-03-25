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

  #environment = {
  #  pathsToLink = [ "/share/pixmaps" ];
  #  systemPackages = with pkgs; [
  #    qt5ct
  #    qt6ct
  #  ];
  #  variables = {
  #    QT_QPA_PLATFORMTHEME = "qt5ct";
  #    QT_QPA_PLATFORM = "wayland";
  #    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  #    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  #  };
  #};
}
