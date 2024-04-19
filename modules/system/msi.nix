{ inputs, config, pkgs, ... }:
{
  hardware = {
    logitech.wireless.enable = true;
    logitech.wireless.enableGraphical = true;
    enableAllFirmware = true;
  };

  boot = {
    # Kernel
    kernelParams = [
      "quiet" "loglevel=0" "splash" "systemd.show_status=false" "iommu=pt" "psi=1"   
    ];

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
}