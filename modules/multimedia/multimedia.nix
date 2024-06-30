{
  pkgs,
  config,
  inputs,
  ...
}:

{
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
  sound.enable = true;
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
}