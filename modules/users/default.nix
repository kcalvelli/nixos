{ inputs, ... }:
{
  imports = [
    ./keith.nix
    ./louie.nix
  ];

  # Configure home-manager
  home-manager = {
    extraSpecialArgs.inputs = inputs; # forward the inputs
    useGlobalPkgs = true; # don't create another instance of nixpkgs
    useUserPackages = true; # install user packages directly to the user's profile
  };
}