{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    obs-studio
    kdenlive
    vlc
    mediainfo
    glaxnimate
  ];
}

