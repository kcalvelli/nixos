{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.self.packages.${pkgs.system}.brave-browser
    nextcloud-client
    thunderbird
    google-chrome
    networkmanagerapplet
  ];
}
