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
    system76 = ./harware/system76;
    msi = ./hardware/msi.nix;
  };
}
