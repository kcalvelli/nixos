{ pkgs, config, inputs, ... }:
{
  sound.enable = true;

  # Make pipewire realtime capable
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
}
