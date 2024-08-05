{ ... }:
{
  flake.nixosModules = {
    apps = ./apps;
    config = ./config;
    desktop = ./desktop;
    fonts = ./fonts;
    gaming = ./gaming;
    hardware = ./hardware;
    graphics = ./graphics;
    networking = ./networking;
    services = ./services;
    users = ./users;
    virt = ./virtualisation;
    system76 = ./hardware/system76.nix;
    msi = ./hardware/msi.nix;
  };
}
