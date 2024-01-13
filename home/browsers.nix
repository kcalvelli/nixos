{ inputs, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    brave-browser-nightly 
    brave 
    libsForQt5.plasma-browser-integration
  ];
}