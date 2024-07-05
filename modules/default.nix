{ ... }:
{
  flake.nixosModules = {

    config = ./config;
    common = ./common;
    desktop = ./desktop;
    development = ./development;
    fonts = ./fonts;
    gaming = ./gaming;
    graphics = ./graphics;
    networking = ./networking;
    printing = ./printing;
    productivity = ./productivity;
    sound = ./sound;
    utils = ./utils;
    system76 = ./hardware/system76.nix;
    msi = ./hardware/msi.nix;
    users = ./users;
    virtualisation = ./virtualisation;
  };
}
