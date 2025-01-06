{ lib, ... }:
{
  # Make pipewire realtime capable
  security.rtkit.enable = true;
  # Can't have pulse and pipewire 
  #hardware.pulseaudio.enable = lib.mkForce false;

  services = {
    ### Pipewire
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
