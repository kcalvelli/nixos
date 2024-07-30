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
  flake.homeModules.workstation = ./workstation.nix;
  flake.homeModules.laptop = ./laptop.nix;
}
