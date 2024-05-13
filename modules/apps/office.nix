{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    libreoffice-fresh
    mate.atril
  ]; 
}