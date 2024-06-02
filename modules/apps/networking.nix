{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.self.packages.${pkgs.system}.brave-browser
    nextcloud-client
    telegram-desktop   
    thunderbird
    google-chrome
    networkmanagerapplet
  ];
}
