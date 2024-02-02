# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Common stuff
      #../common.nix

      # Piece together base system
      #../../system
      #../../system/hardware/msi      
      #../../system/desktop/kde   
      #../../system/crypto
      #../../system/printing
      #../../system/networking
      #../../system/virtualization
      #../../system/pipewire
      ../../system/apps

      # Define users
      ../../users/keith

      inputs.self.nixosModules.desktop
      inputs.self.nixosModules.plasma
      inputs.self.nixosModules.msi
      inputs.self.nixosModules.virtualization

    ];

  networking = { 
    hostName = "office"; # Define your hostname.
  };
}
