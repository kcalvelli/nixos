# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.home-manager.nixosModules.default
    ] ++(with inputs.self.nixosModules; [
    cosmic
    msi
    apps
    hosting
    users
    common
    network
    bridge
    virtualisation
    filesystems
    printing
    security
    nix
    sound
    graphics
  ]);

  networking = { 
    hostName = "office"; # Define your hostname.
  };
  services.resolved.extraConfig = ''
    [Resolve]
    #DNS=45.90.28.0#office-6854e6.dns.nextdns.io
    #DNS=2a07:a8c0::#office-6854e6.dns.nextdns.io
    #DNS=45.90.30.0#office-6854e6.dns.nextdns.io
    #DNS=2a07:a8c1::#office-6854e6.dns.nextdns.io
    DNS=76.76.2.22#y2p8p3h5on.dns.controld.com
    DNSOverTLS=yes
  '';
}
