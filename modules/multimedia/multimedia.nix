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

  environment.systemPackages = with pkgs; [
    clapper
    gnomecast
  ];
  sound.enable = true;

  # Make pipewire realtime capable
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
}
