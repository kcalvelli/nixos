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
      sushi.enable = true;
    };      
  };

  programs = {
    evince.enable = true;
    file-roller.enable = true;
    geary.enable = true;
    gnome-disks.enable = true;
    seahorse.enable = true;
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
    sessionVariables = {
      QT_WAYLAND_DECORATION = "adwaita";
    };
  };  
}
