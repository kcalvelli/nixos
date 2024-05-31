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
  ];

  boot.kernel.sysctl = {
    "kernel.split_lock_mitigate" = 0;
  };

  custom.lact = {
    enable = true;
  };
}