{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #inputs.self.packages.${pkgs.system}.brave-browser
    brave
    inputs.self.packages.${pkgs.system}.quick-webapps
    nextcloud-client
    #valent 
  ];
}
