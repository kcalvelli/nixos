{ pkgs, ... }:
{
  imports = [
    ./openwebui.nix
    ./caddy.nix
    ./rustdeskserver.nix
  ];
}
