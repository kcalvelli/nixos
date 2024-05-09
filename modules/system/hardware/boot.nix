{ pkgs, ... }:
{
  boot = {
    bootspec.enable = true;

    initrd = {
      systemd.enable = true; 
      verbose = false;  
    };
    # Plymouth is purty
    plymouth.enable = true;
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };

  # Wasn't sure where to put this so here it is
  # Enable firmware updates
  services.fwupd.enable = true;
}