{ ... }:
{
  flake.nixosModules = {

    config = ./config;
    core = ./core;
    development = ./development;
    gaming = ./gaming;
    graphics-multimedia = ./graphics-multimedia;
    networking = ./networking;
    printing = ./printing;
    productivity = ./productivity;
    utils = ./utils;
    system76 = ./hardware/system76.nix;
    msi = ./hardware/msi.nix;
  };
}