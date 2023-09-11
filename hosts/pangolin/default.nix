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
      ../../system/fonts
      ../../system/printing
      ../../system/networking
      ../../system/virtualization
      ../../system/pipewire

      # Applications to be installed, similar to patterns in that other OS 
      ../../applications/shell
      ../../applications/games
      ../../applications/waydroid
      ../../applications/internet
      ../../applications/graphics
      ../../applications/video
      ../../applications/editors
      ../../applications/office
      
      # Define users
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
