{ ... }:
{
  flake.nixosModules = {

    config = ./config;
    core = ./core;
    desktop = ./desktop;
    development = ./development;
    gaming = ./gaming;
    multimedia = ./multimedia;
    networking = ./networking;
    printing = ./printing;
    productivity = ./productivity;
    utils = ./utils;
    system76 = ./hardware/system76.nix;
    msi = ./hardware/msi.nix;
    virtualisation = ./virtualisation;
  };
}
