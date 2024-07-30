{ inputs, lib, pkgs, ... }:
{
  imports = [
    #./gnome.nix
    ./cosmic.nix
    ./hyprland.nix
  ];
  cosmic.enable = true;
  #gnome.enable = true;
  hyprland.enable = true;
}
