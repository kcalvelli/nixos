{ pkgs, ... }:
{
  # Import necessary service modules
  imports = [
    ./openwebui.nix
    ./caddy.nix
  ];
}
