# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      inputs.self.nixosModules.cosmic
      inputs.self.nixosModules.lomiri
      #inputs.self.nixosModules.plasma
      inputs.self.nixosModules.msi
      inputs.self.nixosModules.apps 
      inputs.self.nixosModules.hosting
      inputs.self.nixosModules.users
      inputs.self.nixosModules.common
      inputs.self.nixosModules.network
      inputs.self.nixosModules.bridge
      inputs.lanzaboote.nixosModules.lanzaboote    
    ];

  networking = { 
    hostName = "office"; # Define your hostname.
  };

  boot = {
    loader.systemd-boot.enable = lib.mkForce false;
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
}
