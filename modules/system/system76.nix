 
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
     "quiet" "loglevel=0" "splash" "systemd.show_status=false" "i8042.noaux" "iommu=pt" "amdgpu.noretry=0" "amdgpu.lockup_timeout=1000" "amdgpu.gpu_recovery=1" "ahci.mobile_lpm_policy=3"  
    ];
    blacklistedKernelModules = [ "psmouse" ];
  };

  # Enable all the system76 stuff
  hardware = {
    enableAllFirmware = true;
  };
}
