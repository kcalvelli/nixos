{ ... }:
{
  flake.nixosModules = {
    apps = ./apps;
    config = ./config;
    desktopEnvironment = ./desktopEnvironment;
    features = ./features;
    fonts = ./fonts;
    gaming = ./gaming;
    hardware = ./hardware;
    graphics = ./graphics;
    networking = ./networking;
    users = ./users;
    virtualisation = ./virtualisation;
  };
}
