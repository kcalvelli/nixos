# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Include common stuff
      ../common.nix

      # Piece together base system
      ../../system
      ../../system/hardware/System76      
      ../../system/desktop/kde      
      ../../system/crypto
      ../../system/printing
      ../../system/networking
      ../../system/virtualization
      ../../system/pipewire
      ../../system/apps
      
      # Define users
      ../../users/keith
      
    ];

  networking = { 
    hostName = "pangolin"; # Define your hostname.
  };  
}
