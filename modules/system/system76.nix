 
{ inputs, config, pkgs, ... }:
{
  boot = {
    # Kernel
    kernelParams = [
     "quiet" "loglevel=0" "splash" "systemd.show_status=false" "i8042.noaux" "iommu=pt" "amdgpu.noretry=0" "amdgpu.lockup_timeout=1000" "amdgpu.gpu_recovery=1" "ahci.mobile_lpm_policy=3"  
    ];
    kernelModules = [ "amdgpu" ];
    blacklistedKernelModules = [ "psmouse" ];
    loader.systemd-boot.enable = true;
  };

  # Enable all the system76 stuff
  hardware = {
    system76 = {
      enableAll = true;
      kernel-modules.enable = true;
    };
    enableAllFirmware = true;
  };
}
