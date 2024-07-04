{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    ./lact
  ];

  environment.systemPackages = with pkgs; [
    lact
    radeontop
    rocmPackages.rocm-smi
    umr
    gimp
    amdgpu_top
  ];

  boot.kernel.sysctl = {
    "kernel.split_lock_mitigate" = 0;
  };

  custom.lact = {
    enable = true;
  };

  hardware = {
    graphics = {
      extraPackages = with pkgs; [ 
        rocmPackages.clr.icd
        rocm-opencl-runtime
        #amdvlk        
      ];
      extraPackages32 = with pkgs; [
        #driversi686Linux.amdvlk
      ];
    };
  };
}
