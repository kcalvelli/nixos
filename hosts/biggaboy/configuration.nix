# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager 
      ../../modules
      ../../modules/kde
      #../../modules/kde-pim
      ../../modules/hp
      ../../modules/shell
      ../../modules/games
      ../../modules/amd
      ../../modules/pipewire
      ../../modules/printing
      ../../modules/networking
      ../../modules/waydroid
      ../../modules/virtualization
      ../../modules/android
      ../../modules/internet
      ../../modules/graphics
      ../../modules/video
      ../../modules/editors
      ../../modules/crypto
      ../../modules/fonts
      ../../modules/office
      ../../modules/containers
      ../../modules/remote

      # Users
      ../../users/keith
      ../../users/john
    ];

  networking = { 
    hostName = "biggaboy"; # Define your hostname.
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
 
  # Auto upgrade
  system.autoUpgrade = {
      enable = true;
      flake = "github:kcalvelli/nixos#biggaboy";
      flags = [
        "--no-write-lock-file"
        "--update-input" "nixpkgs"
      ];
  };
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
