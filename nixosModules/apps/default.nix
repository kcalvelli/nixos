{ pkgs, inputs, ... }:

{
  flake.nixosModules = {
    development = ./development.nix;
    games = ./games.nix;
    multimedia = ./multimedia.nix;
    terminal = ./terminal.nix;
    networking = ./networking.nix;
    virtualization = ./virtualization.nix;
    apps = ./apps.nix;
    office = ./office.nix;
    graphics = ./graphics.nix;
    scientific = ./scientific.nix;
    emulators = ./emulators.nix;
    filesystems = ./filesystems.nix;
    fonts = ./fonts.nix;
    tools = ./tools.nix;
  };
}