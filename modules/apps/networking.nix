{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.self.packages.${pkgs.system}.brave-browser
    #brave
    nextcloud-client
    telegram-desktop   
    thunderbird
    valent
  ];
}