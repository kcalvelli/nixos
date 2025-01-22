{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableAllFirmware = true;
  };

  # Firmware
  services.fwupd.enable = true;
}
