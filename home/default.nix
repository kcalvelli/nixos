{ inputs, config, ... }:

let
  hmConfig =
    pkgs: module:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        inherit inputs;
      };
    };
in
{

  flake.homeModules.shell = ./shell;
  flake.homeModules.virtualisation = ./virtualisation;
  flake.homeModules.git = ./git;
  flake.homeModules.desktop = ./desktop;
  flake.homeModules.laptop = ./laptop;
}
