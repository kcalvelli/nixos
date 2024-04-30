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
    graphics
   # emulators
    filesystems
    fonts
    utils
  ]);
}