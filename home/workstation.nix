{ inputs, config, pkgs, ... }:
{
  imports = [
    ./pwa.nix
    ./solaar.nix
    ./virtualisation.nix
    ./shell.nix
    ./development.nix
    #./ags.nix
    #./hyprland.nix
    ./office.nix
    ./gnome-settings.nix
  ];  
}
