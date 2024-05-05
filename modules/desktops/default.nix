{ ... }:
{
  flake.nixosModules = {
    plasma = ./plasma.nix;
    cosmic = ./cosmic.nix;
    cinnamon = ./cinnamon.nix;
  };
}