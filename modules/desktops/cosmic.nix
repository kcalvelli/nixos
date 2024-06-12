{ inputs, pkgs, config, utils, lib, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  #Just cosmic
  services.desktopManager.cosmic.enable = true;

  environment.systemPackages = with pkgs; {
    adw-gtk3
  };
  #services.displayManager.cosmic-greeter.enable = true;

  #services = {
  #  gvfs.enable = true;
  #  acpid.enable = true;
  #  gnome.sushi.enable = true;
  #  gnome.gnome-keyring.enable = true; 
  #};

  #programs = {
  #  evince.enable = true;
  #  file-roller.enable = true;
  #  gnome-disks.enable = true;
  #  seahorse.enable = true;
  #};

  #environment.systemPackages = with pkgs; [
  #  adw-gtk3   
  #  cosmic-tasks
  #  cosmic-emoji-picker
    #inputs.self.packages.${pkgs.system}.cosmic-webapps
  #  gnome.nautilus
  #  nautilus-open-any-terminal
  #];

  #environment.sessionVariables.NAUTILUS_4_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
  #environment.pathsToLink = [
  #  "/share/nautilus-python/extensions"
  #];
  #security.pam.services.login.enableGnomeKeyring = true;
    
   # Minimize how bad qt apps look here
  #qt.enable = true;
  #qt.style = "adwaita-dark";
  #qt.platformTheme = "gnome";

  # seed configuration in nixos-generate-config
  #system.nixos-generate-config.desktopConfiguration = [''
  #  # Enable the COSMIC Desktop Environment.
  #  services.displayManager.cosmic-greeter.enable = true;
  #  services.desktopManager.cosmic.enable = true;
  #''];

  # environment packages
  #environment.etc."cosmic-comp/config.ron".source = lib.mkDefault "${pkgs.cosmic-comp}/etc/cosmic-comp/config.ron";
  #environment.pathsToLink = [ "/share/cosmic" ];
  #environment.systemPackages = utils.removePackagesByName (with pkgs; [
  #  adw-gtk3
  #  alsa-utils
  #  cosmic-applets
  #  cosmic-applibrary
  #  cosmic-bg
  #  cosmic-comp
  #  cosmic-edit
  #  cosmic-files
  #  cosmic-greeter
  #  cosmic-icons
  #  cosmic-launcher
  #  cosmic-notifications
  #  cosmic-osd
  #  cosmic-panel
  #  cosmic-randr
  #  cosmic-screenshot
  #  cosmic-session
  #  cosmic-settings
  #  cosmic-settings-daemon
  #  cosmic-term
  #  cosmic-workspaces-epoch
  #  gnome.adwaita-icon-theme
  #  hicolor-icon-theme
  #  pop-icon-theme
  #  pop-launcher
  #] ++ lib.optionals config.services.flatpak.enable [
  #  cosmic-store
  #]) config.environment.cosmic.excludePackages;

  # xdg portal packages and config
  #xdg.portal = {
  #  enable = true;
  #  extraPortals = with pkgs; [
  #    xdg-desktop-portal-cosmic
  #  ] ++ lib.optional (!config.services.xserver.desktopManager.gnome.enable) pkgs.xdg-desktop-portal-gtk; # https://github.com/lilyinstarlight/nixos-cosmic/issues/17#issuecomment-2139612801
  #  configPackages = lib.mkDefault (with pkgs; [
  #    xdg-desktop-portal-cosmic
  #  ]);
  #};

  # fonts
  #fonts.packages = utils.removePackagesByName (with pkgs; [
  #  fira
  #]) config.environment.cosmic.excludePackages;

  # required features
  #hardware.opengl.enable = true;
  #services.libinput.enable = true;
  #xdg.mime.enable = true;
  #xdg.icons.enable = true;

  # optional features
  #hardware.bluetooth.enable = lib.mkDefault true;
  #services.acpid.enable = lib.mkDefault true;
  #services.pipewire = {
  #  enable = lib.mkDefault true;
  #  alsa.enable = lib.mkDefault true;
  #  pulse.enable = lib.mkDefault true;
  #};
  #services.gvfs.enable = lib.mkDefault true;
  #networking.networkmanager.enable = lib.mkDefault true;
  #services.gnome.gnome-keyring.enable = lib.mkDefault true;

  # general graphical session features
  #programs.dconf.enable = lib.mkDefault true;

  # required dbus services
  #services.accounts-daemon.enable = true;
  #services.upower.enable = true;
  #services.power-profiles-daemon.enable = lib.mkDefault (!config.hardware.system76.power-daemon.enable);
  #security.polkit.enable = true;

  # session packages
  #services.displayManager.sessionPackages = with pkgs; [ cosmic-session ];
  #systemd.packages = with pkgs; [ cosmic-session ];
  ## TODO: remove when upstream has XDG autostart support
  #systemd.user.targets.cosmic-session = {
  #  wants = [ "xdg-desktop-autostart.target" ];
  #  before = [ "xdg-desktop-autostart.target" ];
  #};

  ## required for screen locker
  #security.pam.services.cosmic-greeter = {};
      
}
