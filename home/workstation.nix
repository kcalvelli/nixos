{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./common.nix
    ./solaar.nix
  ];
}
