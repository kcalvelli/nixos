# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
     
      #  Home-manager     
      ../../home 

      # Piece together base system
      ../../system
      ../../system/hardware/msi      
      ../../system/desktop/kde   
      ../../system/crypto
      ../../system/printing
      ../../system/networking
      ../../system/virtualization
      ../../system/pipewire
      ../../system/services

      # Define users
      ../../users/keith

    ];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  networking = { 
    hostName = "office"; # Define your hostname.
  };
 
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Auto upgrade
  system.autoUpgrade = {
      enable = false;
      flake = "github:kcalvelli/nixos#office";
      flags = [
        "--no-write-lock-file"
        "--update-input" "nixpkgs"
      ];
  };

  programs.captive-browser.interface = "wlp41s0";
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
