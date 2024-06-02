{ ... }:
{
  flake.nixosModules = {
    plasma = ./plasma.nix;
    cosmic = ./cosmic.nix;
    gnome = ./gnome.nix;
  };
}