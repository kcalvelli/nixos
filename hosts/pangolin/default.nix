# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      inputs.home-manager.nixosModules.default
    ]
    ++ (with inputs.self.nixosModules; [
      # First the system
      # Hardware
      boot
      graphics
      system76
      sound

      # Core
      nix
      environment
      filesystems
      fonts
      security
      users

      # Network
      network
      avahi
      samba
      #zerotier

      # Services
      printing
      virtualisation

      # Then a desktop  
      cosmic
      #plasma
      #gnome

      # Then apps
      cli
      development
      #games
      multimedia
      networking
      office
      scientific
      utils
    ]);

  networking = {
    hostName = "pangolin"; # Define your hostname.
  };

  services.resolved.extraConfig = ''
    [Resolve]
    DNS=76.76.2.22#1vcddi9p25b.dns.controld.com
    DNSOverTLS=yes
  '';
}
