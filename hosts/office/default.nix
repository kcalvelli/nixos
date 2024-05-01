# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.home-manager.nixosModules.default
    ] ++(with inputs.self.nixosModules; [

    # First the system
    # Hardware
    # Network
    network
    bridge
    avahi
    samba

    boot
    environment
    filesystems
    graphics
    hosting
    msi
    
    nix
    printing
    security
    sound
    timers
    users
    virtualisation
    fonts

    # Then a desktop  
    cosmic

    # Then apps
    cli
    development
    games
    multimedia
    networking
    office
    scientific
    utils
  ]);

  networking = { 
    hostName = "office"; # Define your hostname.
  };
  services.resolved.extraConfig = ''
    [Resolve]
    DNS=76.76.2.22#y2p8p3h5on.dns.controld.com
    DNSOverTLS=yes
  '';
}
