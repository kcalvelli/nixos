{ inputs, outputs, pkgs, ... }:
{
  imports = [
    ./base.nix    
    ./browsers.nix
    ./cli.nix    
    ./cloud.nix
    ./contacts.nix
    ./dev.nix
    ./fonts.nix
    ./games.nix
    ./media.nix
    ./virt.nix
  ];
}