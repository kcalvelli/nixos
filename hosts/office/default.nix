# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.home-manager.nixosModules.default
    ]
    ++ (with inputs.self.nixosModules; [
      config
      core
      development
      gaming
      multimedia
      networking
      printing
      productivity
      msi
      utils
      virtualisation
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
