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
      config
      development
      gaming
      graphics-multimedia
      networking
      printing
      productivity
      system
      system76
      utils
      virtualisation
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
