{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [ 
    gamescope
    mangohud
    protontricks
    superTuxKart
  ];
}