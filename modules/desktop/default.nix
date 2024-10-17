{ inputs, lib, pkgs, ... }:
{
  imports = [
    ./cosmic.nix
  ];
  cosmic.enable = true;

  ### Services and stuff needed by all WMs/DEs
  services = {
    #flatpak.enable = true;
    udisks2.enable = true;
    system76-scheduler.enable = true;      
  };

  programs = {
    evince.enable = true;
    file-roller.enable = true;
    gnome-disks.enable = true;
    seahorse.enable = true;
  };

  # Minimize how bad qt apps look
  #qt.enable = true;
  #qt.style = "adwaita-dark";

  environment = {   
    sessionVariables = {
      #QT_WAYLAND_DECORATION = "adwaita";
      MOZ_ENABLE_WAYLAND = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      
    };
  };  

  # Desktop apps common to all WMs/DEs
  environment.systemPackages = with pkgs; [
    libreoffice-fresh
    baobab
    adw-gtk3
    qadwaitadecorations
    qadwaitadecorations-qt6   
    qalculate-gtk
    brave
    openssl 
    nextcloud-client
    thunderbird
    pinta
  ];  

  fonts.packages = with pkgs; [
    inter
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
