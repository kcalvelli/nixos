{ ... }:
{
  flake.nixosModules = {
    apps = ./apps;
    config = ./config;
    desktopEnvironment = ./desktopEnvironment;
    fonts = ./fonts;
    gaming = ./gaming;
    hardware = ./hardware;
    graphics = ./graphics;
    networking = ./networking;
    services = ./services;
    users = ./users;
    virtualisation = ./virtualisation;
  };
}
