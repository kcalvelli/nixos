{
  description = "Keith Calvelli's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = "github:hercules-ci/flake-parts";
    };

    flake-utils.inputs.systems.follows = "systems";

    systems.url = "github:nix-systems/x86_64-linux";

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };

    devshell = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/devshell";
    };

    flake-utils.url = "github:numtide/flake-utils";

    lanzaboote.url = "github:nix-community/lanzaboote";

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      #url = "github:drakon64/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";

  };

  outputs =
    inputs@{
      flake-parts,
      systems,
      lanzaboote,
      nixos-cosmic,
      nixpkgs,
      nix-flatpak,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;

      imports = [
        ./pkgs
        ./hosts
        ./modules
        ./home
      ];
    };
}
