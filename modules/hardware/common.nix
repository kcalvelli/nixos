{ config, lib, pkgs, inputs, ... }: 
{
  imports = [
    ./boot.nix
    ./printing.nix
    ./sound.nix  
  ];

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;  
    enableAllFirmware = true;
  };

  # Firmware
  services.fwupd.enable = true;

  # Use kernel 6.10 for all machines
  boot.kernelPackages = pkgs.linuxPackages_6_10;
}
