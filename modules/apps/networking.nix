{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.self.packages.${pkgs.system}.brave-browser
    inputs.self.packages.${pkgs.system}.quick-webapps
    nextcloud-client
    networkmanagerapplet
    valent
    google-chrome
  ];
}
