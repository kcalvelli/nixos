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
  flake.homeModules.desktop = ./desktop;
#  flake.homeModules.terminal = ./terminal;
}