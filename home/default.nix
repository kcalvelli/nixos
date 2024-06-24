{ inputs, config, ... }:

let
  hmConfig = pkgs: module:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs; };
    };
in
{
  flake.homeModules.desktop = ./desktop;
  flake.homeModules.cli = ./cli;
  flake.homeModules.virtualisation = ./virtualisation;
  flake.homeModules.development = ./development;

}
