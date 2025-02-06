{ lib, ... }:
{
  # Enable real-time capabilities for PipeWire
  security.rtkit.enable = true;

  # Configure sound services
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };
}
