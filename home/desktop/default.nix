{ config, pkgs, ... }:
{
  imports = [
    ../pwa
    ../solaar
    ../virtualisation
    ../shell
    ../development
  ];
}