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
    clapper
    gnomecast    
  ];


  boot.kernel.sysctl = {
    "kernel.split_lock_mitigate" = 0;
  };

  custom.lact = {
    enable = true;
  };

  hardware = {
    graphics = {
      enable32Bit = true;
      extraPackages = with pkgs; [ 
        rocmPackages.clr.icd
        rocm-opencl-icd
        rocm-opencl-runtime
        vulkan-loader
        vulkan-validation-layers
        vulkan-extension-layer      
      ];
    };
  };
}
