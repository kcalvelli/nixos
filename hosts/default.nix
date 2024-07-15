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
    edge = nixosSystem {
      system = "x86_64-linux";
      modules = [ ./edge ];
    };
    pangolin = nixosSystem {
      system = "x86_64-linux";
      modules = [ ./pangolin ];
    };
  };
}
