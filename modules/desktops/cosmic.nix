{ inputs, pkgs, config, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  #Just cosmic
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  services = {
    gnome.core-utilities.enable = true;
    gnome.core-shell.enable = true;
    tumbler.enable = true;
    gvfs.enable = true;
    acpid.enable = true;
    gnome.sushi.enable = true;
    gnome.gnome-keyring.enable = true; 
    gnome.tracker.enable = true;
    gnome.tracker-miners.enable = true;
    gnome.gnome-online-accounts.enable = true;
    gnome.gnome-settings-daemon.enable = true;
    gnome.gnome-user-share.enable = true;
    gnome.glib-networking.enable = true;
    flatpak.enable = true;
  };

  programs = {
    evince.enable = true;
    file-roller.enable = true;
    gnome-disks.enable = true;
    seahorse.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome.epiphany
    gnome-text-editor
    gnome.gnome-calendar
    gnome.gnome-characters
    gnome.gnome-clocks
    gnome-console
    gnome.gnome-contacts
    gnome.gnome-font-viewer
    gnome.gnome-maps
    gnome.gnome-music
    gnome.gnome-system-monitor
    gnome.gnome-weather
    gnome.totem
    gnome.yelp
  ];

  environment.systemPackages = with pkgs; [
    adw-gtk3   
    cosmic-tasks
    cosmic-emoji-picker
    inputs.self.packages.${pkgs.system}.cosmic-webapps
  ];

  environment.sessionVariables.NAUTILUS_4_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
  environment.pathsToLink = [
    "/share/nautilus-python/extensions"
  ];
  security.pam.services.login.enableGnomeKeyring = true;
   
   # Minimize how bad qt apps look here
  qt.enable = true;
  qt.style = "adwaita-dark";
  qt.platformTheme = "gnome";
}
