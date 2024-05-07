 
{ inputs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.system76
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.nixos-hardware.nixosModules.common-cpu-amd
  ];
  boot = {
    # Kernel
    kernelParams = [
     "ro" "quiet" "loglevel=0" "splash" "systemd.show_status=false"   
    ];
    blacklistedKernelModules = [ "psmouse" ];
    loader.systemd-boot.enable = true;
  };

  # Enable all the system76 stuff
  hardware = {
    enableAllFirmware = true;
  };
}
