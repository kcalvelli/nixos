{ ... }:
{
  flake.nixosModules = {
    common = ./common.nix;
    desktop = ./desktop.nix;
    plasma = ./plasma.nix;
    virtualization = ./virtualization.nix;
    system76 = ./system76.nix;
    msi = ./msi.nix;
    gear = ./gear.nix;
    kdepim = ./kdepim.nix;
    games = ./games.nix;
    #graphics = ./graphics.nix;
    multimedia = ./multimedia.nix;
    system = ./system.nix;
    terminal = ./terminal.nix;
    development = ./development.nix;  
    apps = ./apps.nix;
    internet = ./internet.nix;
    cosmic = ./cosmic.nix;
    cache = ./cache.nix;
  };
}