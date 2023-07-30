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
      ../../modules/kde
      #../../modules/kde-pim
      ../../modules/System76
      ../../modules/shell
      ../../modules/games
      ../../modules/amd
      ../../modules/pipewire
      ../../modules/printing
      ../../modules/networking
      ../../modules/waydroid
      ../../modules/virtualization
      ../../modules/android
      ../../modules/internet
      ../../modules/graphics
      ../../modules/video
      ../../modules/editors
      ../../modules/crypto
      ../../modules/fonts
      ../../modules/office

      # Users
      ../../users/keith
    ];


  networking = { 
    hostName = "pangolin"; # Define your hostname.
  };
 
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "qtwebkit-5.212.0-alpha4"
      ];
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

  system.stateVersion = "23.05"; # Did you read the comment?

}
