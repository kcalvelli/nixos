{ config, lib, pkgs, inputs, ... }:
{
  hardware = {
    # Update AMD CPU microcode if redistributable firmware is enabled
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableAllFirmware = true;
  };

  # Enable firmware updates
  services.fwupd.enable = true;
}
