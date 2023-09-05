{ inputs, config, pkgs, ... }:
{
  programs = {
    adb.enable = true;
    droidcam.enable = true;
  };
} 
