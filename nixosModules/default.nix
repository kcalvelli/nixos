{ inputs, config, pkgs, lib, ... }:
{
  imports = [
    ./apps
    ./system
    ./desktops
  ];
}