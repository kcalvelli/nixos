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
      common
      config
      desktop
      development
      fonts
      graphics
      networking
      printing
      productivity
      sound
      system76
      users
      utils
      virtualisation
    ]);

  home-manager.users = {
    keith = {
      imports = with inputs.self.homeModules; [
        laptop
      ];
    };
  }; 
  networking = {
    hostName = "pangolin"; # Define your hostname.
  };

  #boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
}
