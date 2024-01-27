 
{ inputs, config, pkgs, ... }:
{
  imports = [
    ../common.nix
  ];
  
  boot = {
    # Kernel
    kernelParams = [
      "quiet" "i8042.noaux" "iommu=pt" "amdgpu.noretry=0" "amdgpu.lockup_timeout=1000" "amdgpu.gpu_recovery=1" "ahci.mobile_lpm_policy=3"  
    ];
    kernelModules = [ "amdgpu" ];
    blacklistedKernelModules = [ "psmouse" ];
  };

  # Enable all the system76 stuff
  hardware.system76.enableAll = true;
  powerManagement.enable = true;
  
}
