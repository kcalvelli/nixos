{ pkgs, inputs, ... }:
{
  imports = (with inputs.self.nixosModules; [
    development
    games
    multimedia
    cli
    networking
    scientific
    office
   # emulators
    fonts
    utils
  ]);
}