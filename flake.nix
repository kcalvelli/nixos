{
  description = "Keith Calvelli's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-utils.inputs.systems.follows = "systems";
    systems.url = "github:nix-systems/x86_64-linux";     
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";       
    devshell.inputs.nixpkgs.follows = "nixpkgs";
    devshell.url = "github:numtide/devshell";  
    flake-utils.url = "github:numtide/flake-utils";
    lanzaboote.url = "github:nix-community/lanzaboote";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";  
  };

  outputs = inputs @ { flake-parts, systems, lanzaboote, nixos-cosmic, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;

    imports = [
      ./packages
      ./config
      ./modules
      ./home_config
    ];
  };
}
