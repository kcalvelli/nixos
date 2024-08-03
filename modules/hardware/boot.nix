{ pkgs, ... }:
{
  # Boot config
  boot = {
    bootspec.enable = true;  
    initrd = {
      systemd.enable = true;
      verbose = false;
    };
    # Plymouth is purty
    plymouth.enable = true;  
    kernelPackages = pkgs.linuxPackages_latest;
  };  
  # Swap config
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };  
  services.udisks2.enable = true;    
}