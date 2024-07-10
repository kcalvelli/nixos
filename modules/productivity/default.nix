{ pkgs, ... }:
{
  # Office
  environment.systemPackages = with pkgs; [ 
    libreoffice-fresh
    teams-for-linux 
  ];
  programs.evince.enable = true;
}
