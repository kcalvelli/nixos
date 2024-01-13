{ inputs, config, pkgs, ... }:
{
  imports = [
    flatpak.nix
    browsers.nix
  ];
}