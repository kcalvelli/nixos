{
  description = "Keith Calvelli's NixOS config";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/23.11";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    #kde2nix.url = "github:nix-community/kde2nix/main";
    nixpkgs.url = "github:K900/nixpkgs/plasma-6";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-utils.inputs.systems.follows = "systems";
    systems.url = "github:nix-systems/x86_64-linux";     
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";       
    devshell.inputs.nixpkgs.follows = "nixpkgs";
    devshell.url = "github:numtide/devshell";  
    #cachix-deploy-flake.url = "github:cachix/cachix-deploy-flake";
    flake-utils.url = "github:numtide/flake-utils";
    lanzaboote.url = "github:nix-community/lanzaboote";
  };

  outputs = inputs @ { flake-parts, systems, lanzaboote, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;
      imports = [
        ./packages
        ./nixosConfigurations
        ./nixosModules
        ./homeConfigurations
      ];
    };
}
