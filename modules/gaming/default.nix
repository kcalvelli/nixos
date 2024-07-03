{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    platformOptimizations.enable = true;
  };
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  hardware = {
    steam-hardware.enable = true;
  };

  environment.systemPackages = with pkgs; [
    superTuxKart
  ];
}
