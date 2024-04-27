{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ripgrep
    fastfetch
    helix
    wget
    curl
    gnugrep
    fish
    starship
  ];   
}