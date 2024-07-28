{ lib, pkgs, inputs, ... }:
{
  nix = {
    package = pkgs.nixFlakes;
    #gc = {
    #  automatic = true;
    #  dates = "daily";
    #  options = "--delete-older-than 5d";
    #};
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    #  auto-optimise-store = true;
      substituters = [
        "https://devenv.cachix.org"
        "https://drakon64-nixos-cosmic.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "drakon64-nixos-cosmic.cachix.org-1:bW2gsh5pbdMxcI3sklvtROM9A8CXtPXgVwmIcO3E3io="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      trusted-users = [
        "root"
      ];
    };
  };

  # Allow unfree
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    hostPlatform = lib.mkDefault "x86_64-linux";
  };

  # Environment setup
  # Time Zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    #GTK_USE_PORTAL = 1;
  }; 

  # Firmware
  services.fwupd.enable = true;
  
  # Causes switch to fail if this is not set
  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;

  system.stateVersion = "23.11"; # Did you read the comment?
}
