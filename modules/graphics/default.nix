{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.common-gpu-amd
  ];

  boot.kernel.sysctl = {
    "kernel.split_lock_mitigate" = 0;
  };

  hardware = {
    graphics = {
      enable32Bit = true;
      extraPackages = with pkgs; [ 
        rocmPackages.clr.icd     
      ];
    };
  };

  environment.systemPackages = with pkgs; [ 
    radeontop
    umr
    gimp
    amdgpu_top
    clinfo
    libcamera
  ];  
}
