{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.common-gpu-amd
  ];

  hardware = {
    amdgpu = {
      opencl = true;
    };
  }; 
}