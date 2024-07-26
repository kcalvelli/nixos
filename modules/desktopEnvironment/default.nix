{ inputs, lib, pkgs, ... }:
{
  imports = [
    ./gnome.nix
    ./cosmic.nix
    ./plasma.nix
  ];
  cosmic.enable = true;
  gnome.enable = true;
  plasma.enable = true; #Specialisation
}
