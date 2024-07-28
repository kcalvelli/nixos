{ inputs, lib, pkgs, ... }:
{
  imports = [
    ./gnome.nix
   # ./cosmic.nix
    ./hyprland.nix
  #  ./plasma.nix
  ];
  #cosmic.enable = true;
  gnome.enable = true;
  hyprland.enable = true;
  #plasma.enable = true; #Specialisation
}
