{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  hardware = {
    steam-hardware.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gamescope
    mangohud
    protontricks
    superTuxKart
  ];
}
