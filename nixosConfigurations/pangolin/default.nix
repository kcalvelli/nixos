# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      inputs.self.nixosModules.cosmic
      inputs.self.nixosModules.plasma
      inputs.self.nixosModules.system76
      inputs.self.nixosModules.apps
      inputs.self.nixosModules.users
      inputs.self.nixosModules.common
    ];

  networking = { 
    hostName = "pangolin"; # Define your hostname.
  };
}
