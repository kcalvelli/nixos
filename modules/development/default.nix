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

    lunarvim
  ];  

  programs.direnv.enable = true;
  services.lorri.enable = true;  
  programs.git.enable = true;   
}