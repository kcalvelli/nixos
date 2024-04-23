# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ] ++(with inputs.self.nixosModules; [
    cosmic
    system76
    apps
    users
    common
    network
  ]);    

  networking = { 
    hostName = "pangolin"; # Define your hostname.
  };

  services.resolved.extraConfig = ''
    [Resolve]
    DNS=45.90.28.0#pangolin-6854e6.dns.nextdns.io
    DNS=2a07:a8c0::#pangolin-6854e6.dns.nextdns.io
    DNS=45.90.30.0#pangolin-6854e6.dns.nextdns.io
    DNS=2a07:a8c1::#pangolin-6854e6.dns.nextdns.io
    DNSOverTLS=yes
  '';  
}
