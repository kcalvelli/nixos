{ inputs, ... }:
let
  nixosSystem =
    args:
    inputs.nixpkgs.lib.nixosSystem (
      {
        specialArgs = {
          inherit inputs;
        };
      }
      // args
    );
in
{
  flake.nixosConfigurations = {
    office = nixosSystem {
      system = "x86_64-linux";
      modules = [ ./office ];
    };
    pangolin = nixosSystem {
      system = "x86_64-linux";
      modules = [ ./pangolin ];
    };
  };
}
