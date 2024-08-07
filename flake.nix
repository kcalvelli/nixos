{
  description = "AxiOS";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";

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

    nix-gaming.url = "github:fufexan/nix-gaming";

    # Hypr
    #hyprland = {
    #  url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    #hyprland-plugins = {
    #  url = "github:hyprwm/hyprland-plugins";
    #  inputs.hyprland.follows = "hyprland";
    #};    
    #hyprlock = {
    #  url = "github:hyprwm/hyprlock";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    #hypridle = {
    #  url = "github:hyprwm/hypridle";
    #  inputs.nixpkgs.follows = "hyprland";
    #};
    #hyprcursor = {
    #  url = "github:hyprwm/hyprcursor";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    
    #ags.url = "github:Aylur/ags";

    #matugen.url = "github:InioX/matugen?ref=v2.2.0";    
  };

  outputs =
    inputs@{
      flake-parts,
      systems,
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
