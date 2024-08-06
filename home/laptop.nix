{ config, pkgs, ... }:
{
  imports = [
    ./pwa.nix
    ./virtualisation.nix
    ./shell.nix
    ./development.nix
    ./ags.nix
    ./hyprland.nix
    ./office.nix
  ];
}
