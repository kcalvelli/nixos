{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
    ./common.nix
  ];

  #Enable this when unstable is updated to master
  services.desktopManager.lomiri.enable = true;
}