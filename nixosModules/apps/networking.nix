{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.self.packages.${pkgs.system}.brave-qt
    #inputs.self.packages.${pkgs.system}.brave-browser-nightly
    #inputs.self.packages.${pkgs.system}.vivaldi
    #brave
    nextcloud-client
    telegram-desktop   
    thunderbird
    localsend
  ];
}