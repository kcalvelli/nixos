{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.self.packages.${pkgs.system}.brave-browser
    inputs.self.packages.${pkgs.system}.thorium
    #brave
    nextcloud-client
    telegram-desktop   
    thunderbird
    valent
    google-chrome
  ];
}