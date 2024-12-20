{
  description = "AxiOS";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs-stable.url = "github:NixOS/nixpkgs/release-24.05";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";

    # Make nixpkgs follow nixos-cosmic to avoid compiling cosmics
    nixpkgs.follows = "nixos-cosmic/nixpkgs";
    #nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";

    # FlakeHub/Determinate
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";
    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";

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

    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    nix-gaming.url = "github:fufexan/nix-gaming";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };    
  };

  outputs =
    inputs@{ determinate, nixpkgs, flake-parts, systems, ... }:

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
