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
  };
  # Swap config
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 30;
  };
  services.udisks2.enable = true;
}
