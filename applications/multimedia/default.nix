{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
  #  obs-studio
    vlc
  #  spotify
  ];
}

