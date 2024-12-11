{ lib, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    devenv
    nil
    nixfmt-rfc-style
    vim
    starship
    fish
    gcc
    github-desktop

    code-cursor

    nvchad
  ];  
  nixpkgs.overlays = [
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
      })
  ];
  programs.direnv.enable = true;
  services.lorri.enable = true;  
  programs.git.enable = true;   
}