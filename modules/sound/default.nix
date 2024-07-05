{ lib, ... }:
{
  sound.enable = true;

  # Make pipewire realtime capable
  security.rtkit.enable = true;

  # Can't have pulse and pipewire 
  hardware.pulseaudio.enable = lib.mkForce false; 
}
