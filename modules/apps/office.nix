{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    evince
    libreoffice-fresh
  ]; 
}