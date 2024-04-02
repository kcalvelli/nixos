{ pkgs, inputs, ... }:
{
  imports = [
    inputs.self.nixosModules.development
    inputs.self.nixosModules.games
    inputs.self.nixosModules.multimedia
    inputs.self.nixosModules.terminal
    inputs.self.nixosModules.networking
    inputs.self.nixosModules.virtualisation
    inputs.self.nixosModules.scientific
    inputs.self.nixosModules.office
    inputs.self.nixosModules.graphics
    inputs.self.nixosModules.emulators
    inputs.self.nixosModules.filesystems
    inputs.self.nixosModules.fonts
    inputs.self.nixosModules.utils
  ];
}