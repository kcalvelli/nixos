# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  imports =
    [
      ./disks.nix
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.home-manager.nixosModules.default
    ]
    ++ (with inputs.self.nixosModules; [
      apps
      common
      config
      desktopEnvironment
      development
      fonts
      gaming
      graphics
      networking
      msi
      users
      virtualisation
    ]);

  apps.all.enable = true;

  home-manager.users = {
    keith = {
      imports = with inputs.self.homeModules; [
        desktop
      ];
    };
  }; 

  networking = {
    hostName = "edge"; # Define your hostname.
  };
}
