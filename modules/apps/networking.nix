{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.self.packages.${pkgs.system}.brave-browser
    nextcloud-client
    microsoft-edge-dev
    networkmanagerapplet
  ];
}
