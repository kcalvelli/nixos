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

  # Desktop apps common to all WMs/DEs
  environment.systemPackages = with pkgs; [
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
    nerd-fonts.fira-code
  ];
}
