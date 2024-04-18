# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ] ++(with inputs.self.nixosModules; [
    cosmic
    msi
    apps
    hosting
    users
    common
    network
    bridge
  ]);

  networking = { 
    hostName = "office"; # Define your hostname.
  };
}
