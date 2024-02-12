{ self, inputs, ... }:
let
  hmConfig = pkgs: module:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = { inherit inputs; };

      modules = [
        module
        {
          home.homeDirectory = "/home/keith";
          home.stateVersion = "24.05";
          home.username = "keith";
        }
      ];
    };
in    
{
  flake.homeModules.configs = ./configs;

  perSystem = { pkgs, lib, system, ... }: {
    legacyPackages.homeConfigurations.configs = hmConfig pkgs ./configs;
  };
}