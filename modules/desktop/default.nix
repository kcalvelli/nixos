{ inputs, lib, pkgs, ... }:
{
  # Import Cosmic configuration
  imports = [ ./cosmic.nix ];
  cosmic.enable = true;

  # Services needed by all WMs/DEs
  services = {
    flatpak.enable = true;
    udisks2.enable = true;
    system76-scheduler.enable = true;
  };

  # Programs needed by all WMs/DEs
  programs = {
    evince.enable = true;
    file-roller.enable = true;
    gnome-disks.enable = true;
    seahorse.enable = true;
  };

  # Environment variables
  environment = {
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
    };
  };

  # Desktop apps common to all WMs/DEs
  environment.systemPackages = with pkgs; [
    baobab
    adw-gtk3
    qalculate-gtk
    (brave.override { commandLineArgs = "--password-store=gnome-libsecret"; })
    inputs.self.packages.${pkgs.system}.brave-browser-nightly
    openssl
    nextcloud-client
    thunderbird
    pinta
    discord
    shotwell
    rustdesk-flutter    

    # Office apps
    libreoffice-fresh
    hunspell
  ];

  # Fonts
  fonts.packages = with pkgs; [
    inter
    nerd-fonts.fira-code
  ];
}
