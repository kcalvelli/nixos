{ ... }:
{
  flake.nixosModules = {
    common = ./common.nix;
    system76 = ./system76.nix;
    msi = ./msi.nix;
    cache = ./cache.nix;
    hosting = ./hosting.nix;
    users = ./users.nix;
  };
}