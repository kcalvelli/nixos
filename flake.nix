{
  description = "AxiOS";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs-stable.url = "github:NixOS/nixpkgs/release-24.05";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    # Make nixpkgs follow nixos-cosmic
    nixpkgs.follows = "nixos-cosmic/nixpkgs";

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";

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

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    nix-gaming.url = "github:fufexan/nix-gaming";
  };

  outputs =
    inputs@{ determinate,nixpkgs, flake-parts, systems, ... }:

    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;
      imports = [
        ./pkgs
        ./hosts
        ./modules
        ./home
      ];
      flake.formatter = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
