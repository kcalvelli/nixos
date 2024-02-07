{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.self.packages.${pkgs.system}.brave-qt
    nextcloud-client
    telegram-desktop
    mailspring   
  ];
}