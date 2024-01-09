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
      ../../system/hardware/System76      
      ../../system/desktop/kde      
      ../../system/crypto
      ../../system/printing
      ../../system/networking
      ../../system/virtualization
      ../../system/pipewire
      
      # Define users
      ../../users/keith
    ];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  networking = { 
    hostName = "pangolin"; # Define your hostname.
  };
 
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

   programs.captive-browser.interface = "wlp2s0";
  
  # Auto upgrade
  system.autoUpgrade = {
      enable = false;
      flake = "github:kcalvelli/nixos#pangolin";
      flags = [
        "--no-write-lock-file"
        "--update-input" "nixpkgs"
      ];
  };

  system.stateVersion = "23.11"; # Did you read the comment?

}
