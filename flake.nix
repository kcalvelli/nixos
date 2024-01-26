{
  description = "Keith Calvelli's NixOS config";

  inputs = {
    # Nixpkgs
    #nixpkgs.url = "github:nixos/nixpkgs/23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # Nixos hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    kde2nix.url = "github:nix-community/kde2nix/main";

  };

  outputs = { self, nixpkgs, nixos-hardware, kde2nix, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib;
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });  

    in
    {
      inherit lib;

      #nixosModules = import ./modules;
      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
      overlays = import ./overlays { inherit inputs outputs; };

      nixosConfigurations = {
        pangolin = lib.nixosSystem {
          modules = [ ./hosts/pangolin nixos-hardware.nixosModules.system76 inputs.kde2nix.nixosModules.default ];
          specialArgs = { inherit inputs outputs; };
        };
        office = lib.nixosSystem {
          modules = [ ./hosts/office inputs.kde2nix.nixosModules.default  ];
          specialArgs = { inherit inputs outputs; };
        };
      };
    };

}
