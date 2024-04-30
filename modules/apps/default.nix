{ config, lib, pkgs, inputs, ... }:

{
  flake.nixosModules = {
    development = ./development.nix;
    games = ./games.nix;
    multimedia = ./multimedia.nix;
    cli = ./cli.nix;
    networking = ./networking.nix;
    apps = ./apps.nix;
    office = ./office.nix;
    scientific = ./scientific.nix;
    emulators = ./emulators.nix;
    fonts = ./fonts.nix;
    utils = ./utils.nix;
  };
}