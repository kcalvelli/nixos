{ pkgs, ... }:
{
  home.packages = [ pkgs.brave-browser-nightly pkgs.brave pkgs.libsForQt5.plasma-browser-integration];
}