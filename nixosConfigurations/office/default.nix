# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      inputs.self.nixosModules.desktop
      inputs.self.nixosModules.plasma
      inputs.self.nixosModules.msi
      inputs.self.nixosModules.virtualization
      inputs.self.nixosModules.apps
      inputs.kde2nix.nixosModules.default   
      inputs.lanzaboote.nixosModules.lanzaboote    
      inputs.self.homeManagerConfigurations
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
