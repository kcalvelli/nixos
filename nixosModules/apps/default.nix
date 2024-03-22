{ pkgs, inputs, ... }:

{
  flake.nixosModules = {
    development = ./development.nix;
    games = ./games.nix;
    multimedia = ./multimedia.nix;
    terminal = ./terminal.nix;
    internet = ./internet.nix;
    virtualization = ./virtualization.nix;
    apps = ./apps.nix;
  };
}