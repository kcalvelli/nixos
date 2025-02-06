{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Import necessary modules
  imports = [
    # inputs.determinate.nixosModules.default
    ./local.nix
    ./nix.nix
    ./boot.nix
    ./printing.nix
    ./sound.nix
  ];

  # Privacy configuration
  programs = {
    gnupg.agent = {
      enable = true;
    };
  };

  # Enable dbus with gcr package
  services.dbus.packages = [ pkgs.gcr ];

  # System packages
  environment.systemPackages = with pkgs; [
    # Common apps
    sshfs
    fuse
    ntfs3g

    # Utilities
    killall
    gnome-firmware

    # Network tools
    wget
    curl

    # System info tools
    pciutils
    wirelesstools
    gtop
    htop

    # Secret management
    libsecret
    lssecret

    # FlakeHub
    inputs.fh.packages.${system}.default 
  ];
}
