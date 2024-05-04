{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.self.packages.${pkgs.system}.brave-browser
    nextcloud-client
    telegram-desktop   
    thunderbird
    inputs.self.packages.${pkgs.system}.valent
   #valent
  ];
}