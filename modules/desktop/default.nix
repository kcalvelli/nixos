{ inputs, lib, pkgs, ... }:
{
  imports = [
    #./gnome.nix
    ./cosmic.nix
    #./hyprland.nix
  ];
  cosmic.enable = true;
  #gnome.enable = true;
  #hyprland.enable = true;

  ### Services and stuff needed by all WMs/DEs
  services = {
    xserver.displayManager.startx.enable = true ; 
    gvfs.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    accounts-daemon.enable = true;
    gnome = {
      evolution-data-server.enable = true;
      glib-networking.enable = true;
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
      tracker-miners.enable = true;
      tracker.enable = true;
    };      
  };

  xdg.portal = {
    enable = true;
  }; 

  security = {
    polkit.enable = true;
  };  

  # Minimize how bad qt apps look
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";   

  environment = { 
    systemPackages = with pkgs;
    [
      gnome-calendar
      gnome.gnome-control-center
      gnome.gnome-weather
      gnome-calculator
      gnome.gnome-clocks
      seahorse
      nautilus
      baobab
      adw-gtk3
      qgnomeplatform-qt6
      qadwaitadecorations
      qadwaitadecorations-qt6    
  ];    
    sessionVariables = {
      QT_WAYLAND_DECORATION = "adwaita";
    };
  };  
}
