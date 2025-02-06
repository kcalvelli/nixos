{ pkgs, ... }:
{
  imports = [
    ./openwebui.nix
    ./caddy.nix
  ];
}
