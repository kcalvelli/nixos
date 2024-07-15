{ lib, pkgs, w... }:
{
  ### Sound
  # Make pipewire realtime capable
  security.rtkit.enable = true;

  # Can't have pulse and pipewire 
  hardware.pulseaudio.enable = lib.mkForce false;

  ### Printing
  services = {
    printing = {
      enable = true;
      drivers = [
        pkgs.hplip
        pkgs.hplipWithPlugin
      ];
    };
  };
}
