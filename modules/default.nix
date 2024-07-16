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
    graphics = ./graphics;
    networking = ./networking;
    system76 = ./hardware/system76.nix;
    msi = ./hardware/msi.nix;
    users = ./users;
    virtualisation = ./virtualisation;
  };
}
