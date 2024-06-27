{ ... }:

{
  flake.nixosModules = {
    development = ./development.nix;
    games = ./games.nix;
    multimedia = ./multimedia.nix;
    cli = ./cli.nix;
    networking = ./networking.nix;
    office = ./office.nix;
    scientific = ./scientific.nix;
    emulators = ./emulators.nix;
    utils = ./utils.nix;
  };
}
