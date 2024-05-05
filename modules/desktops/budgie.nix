{ pkgs, lib, ... }:
{
  services.xserver = {
    desktopManager = {
      cinnamon.enable = true;
    };
  };
  hardware.pulseaudio.enable = lib.mkForce false;
}