{ self, inputs, ...}:
let nixosSystem = args:
  inputs.nixpkgs.lib.nixosSystem ({ specialArgs = { inherit inputs; }; } // args);
in
{
  flake.nixosConfigurations = {
    office = nixosSystem {
      system = "x86_64-linux";
      modules = [  
        inputs.self.nixosModules.cache
        ./office
      ];
    };
    pangolin = nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        inputs.self.nixosModules.cache
        ./pangolin 
      ];
    };
  };
}