{ self, inputs, config, ... }:

let
  hmConfig = pkgs: module:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = { inherit inputs; };

      #modules = [
      #  inputs.self.nixosModules.users
      #];
    };
in
{
  flake.homeModules.desktop = ./desktop;
 #flake.homeModules.terminal = ./terminal;
  flake.homeModules.virtualisation = ./virtualisation;

}
