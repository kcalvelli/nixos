{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    libreoffice-fresh
    teams-for-linux
    mate.atril
  ]; 
}