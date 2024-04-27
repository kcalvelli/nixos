{ pkgs, inputs, ... }:
{
  imports = (with inputs.self.nixosModules; [
    development
    games
    multimedia
    terminal
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