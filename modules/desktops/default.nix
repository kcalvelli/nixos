{ ... }:
{
  flake.nixosModules = {
    plasma = ./plasma.nix;
    cosmic = ./cosmic.nix;
    lomiri = ./lomiri.nix;
  };
}