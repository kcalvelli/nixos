{ ... }:
{
  flake.nixosModules = {
    apps = ./apps;
    config = ./config;
    common = ./common;
    desktopEnvironment = ./desktopEnvironment;
    development = ./development;
    fonts = ./fonts;
    gaming = ./gaming;
    hardware = ./hardware;
    graphics = ./graphics;
    networking = ./networking;
    users = ./users;
    virtualisation = ./virtualisation;
  };
}
