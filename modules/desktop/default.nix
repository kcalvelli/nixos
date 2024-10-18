{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [ ./cosmic.nix ];
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

  environment = {
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";

    };
  };

  ### Uncomment to enable gnome temporarily
  # services.xserver.desktopManager.gnome.enable = true;
  # environment.gnome.excludePackages = with pkgs; [
  #   baobab
  #   epiphany
  #   geary
  #   gnome-text-editor
  #   gnome-calculator
  #   gnome-calendar
  #   gnome-characters
  #   gnome-clocks
  #   gnome-console
  #   gnome-contacts
  #   gnome-font-viewer
  #   gnome-logs
  #   gnome-maps
  #   gnome-music
  #   gnome-system-monitor
  #   gnome-weather
  #   loupe
  #   nautilus
  #   gnome-connections
  #   simple-scan
  #   snapshot
  #   totem
  #   yelp
  # ];

  # Desktop apps common to all WMs/DEs
  environment.systemPackages = with pkgs; [
    libreoffice-fresh
    baobab
    adw-gtk3
    qalculate-gtk
    # Stop trying to launch kdewallet
    (brave.override { commandLineArgs = "--password-store=gnome-libsecret"; })
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
