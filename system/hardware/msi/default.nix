 
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
      "loglevel=3" "iommu=pt" "psi=1"   
    ];
  };
}
