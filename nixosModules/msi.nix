{ inputs, config, pkgs, ... }:
{
  hardware = {
    logitech.wireless.enable = true;
    logitech.wireless.enableGraphical = true;
  };

  boot = {
    # Kernel
    kernelParams = [
      "quiet" 
      "loglevel=0" 
      "splash" 
      "systemd.show_status=false" 
      "psi=1"   
      ""
    ];
  };
}