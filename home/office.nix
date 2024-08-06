{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice-fresh
    teams-for-linux 
  ];
}