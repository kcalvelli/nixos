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
    graphics = ./graphics.nix;
    scientific = ./scientific.nix;
    emulators = ./emulators.nix;
    filesystems = ./filesystems.nix;
    fonts = ./fonts.nix;
    utils = ./utils.nix;
  };
}