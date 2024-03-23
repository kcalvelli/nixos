{ pkgs, inputs, ... }:
{
  imports = [
    inputs.self.nixosModules.development
    inputs.self.nixosModules.games
    inputs.self.nixosModules.multimedia
    inputs.self.nixosModules.terminal
    inputs.self.nixosModules.internet
    inputs.self.nixosModules.virtualization
  ];
}