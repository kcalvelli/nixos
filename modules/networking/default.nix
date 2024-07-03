{ inputs, pkgs, ... }:
{
  imports = [
    ./avahi.nix
    #./bridge.nix
    ./network.nix
    ./samba.nix
    #./zerotier.nix  
    #./hosting.nix
  ];

  environment.systemPackages = with pkgs; [
    #inputs.self.packages.${pkgs.system}.brave-browser
    brave
    nextcloud-client
    valent
    telegram-desktop
  ];
}
