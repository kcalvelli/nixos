{ pkgs, inputs, ... }:
{
  imports = [
    inputs.self.nixosModules.apps.development
    inputs.self.nixosModules.apps.games
    inputs.self.nixosModules.apps.multimedia
    inputs.self.nixosModules..apps.terminal
    inputs.self.nixosModules.apps.internet
    inputs.self.nixosModules.apps.virtualization
  ];
}