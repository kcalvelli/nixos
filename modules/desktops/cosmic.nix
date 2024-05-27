{ inputs, pkgs, config, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  #Just cosmic
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  services = {
    gvfs.enable = true;
    acpid.enable = true;
    gnome.sushi.enable = true;
    gnome.gnome-keyring.enable = true; 
    gnome.tracker.enable = true;
    gnome.tracker-miners.enable = true;
    gnome.gnome-online-accounts.enable = true;
    gnome.gnome-settings-daemon.enable = true;
    gnome.gnome-user-share.enable = true;
    gnome.rygel.enable = true;
    gnome.glib-networking.enable = true;
    udisks2.enable = true;
  };

  programs = {
    evince.enable = true;
    file-roller.enable = true;
    gnome-disks.enable = true;
    seahorse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnome.baobab
    gnome.gnome-calculator
    gnome.gnome-logs
    gnome.nautilus
    gnome.simple-scan
    gnome-connections
    snapshot
    adw-gtk3   
    cosmic-tasks
    cosmic-emoji-picker
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
