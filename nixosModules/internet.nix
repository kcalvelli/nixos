{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.self.packages.${pkgs.system}.brave-qt
    #inputs.self.packages.${pkgs.system}.brave-browser-nightly
    inputs.self.packages.${pkgs.system}.vivaldi
    nextcloud-client
    telegram-desktop
    mailspring   
  ];
}