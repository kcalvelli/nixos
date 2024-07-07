{ pkgs, inputs, ... }:
{

  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    platformOptimizations.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    superTuxKart
  ];
}
