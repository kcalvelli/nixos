# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  imports =
    [
      ./disks.nix
      inputs.home-manager.nixosModules.default
    ]
    ++ (with inputs.self.nixosModules; [
      system
      desktop
      services
      fonts
      gaming
      graphics
      msi
      networking
      users
      virt
    ]);

  hardware.msi.enable = true;

  #Virtualisation
  virt.libvirt.enable = true;
  virt.containers.enable = true;  

  # Services
  services.caddy-proxy.enable = true;
  services.chatbot.enable = true;

  home-manager.sharedModules = with inputs.self.homeModules; [
    workstation
  ];   

  networking = {
    hostName = "edge"; # Define your hostname.
  };
}
