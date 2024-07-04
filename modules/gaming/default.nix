{ pkgs, inputs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  #programs.gamemode = {
  #  enable = true;
  #  enableRenice = true;
  #};
  
  environment.systemPackages = with pkgs; [
    superTuxKart
  ];
}
