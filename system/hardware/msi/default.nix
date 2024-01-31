 
{ inputs, config, pkgs, ... }:
{
  imports = [
    ../common.nix
  ];
  
  hardware = {
    logitech.wireless.enable = true;
    logitech.wireless.enableGraphical = true;
  };

  boot = {
    # Kernel
    kernelParams = [
      "quiet" "loglevel=0" "systemd.show_status=false" "iommu=pt" "psi=1"   
    ];
  };
}
