{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
    inputs.Jovian-NixOS.nixosModules.default
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    platformOptimizations.enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode = {
    enable = true;
    capSysNice = true;
  };

  environment.systemPackages = with pkgs; [
    superTuxKart
    mangohud
  ];
}
