{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brave-browser-nightly 
    brave 
    libsForQt5.plasma-browser-integration
  ];
}