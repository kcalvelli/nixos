# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager 
      ../../modules
      ../../desktop/kde
      ../../hardware/System76
      #../../hardware/amd      
      ../../modules/shell
      ../../modules/games
      ../../modules/pipewire
      ../../modules/printing
      ../../modules/networking
      ../../modules/waydroid
      ../../modules/virtualization
      #../../modules/android
      ../../modules/internet
      ../../modules/graphics
      ../../modules/video
      ../../modules/editors
      ../../modules/crypto
      ../../modules/fonts
      ../../modules/office
      #../../modules/remote

      ../../users/keith
    ];


  networking = { 
    hostName = "pangolin"; # Define your hostname.
  };
 
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  
  # Auto upgrade
  system.autoUpgrade = {
      enable = true;
      flake = "github:kcalvelli/nixos#pangolin";
      flags = [
        "--no-write-lock-file"
        "--update-input" "nixpkgs"
      ];
  };

  system.stateVersion = "23.11"; # Did you read the comment?

}
