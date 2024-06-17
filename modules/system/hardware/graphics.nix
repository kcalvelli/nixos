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
  

  hardware = {
    amdgpu = {
      amdvlk.enable = true;
      amdvlk.support32Bit.enable = true;
      loadInInitrd = true;
      opencl = true;
    };
  };

  ## HIP
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      rocm-opencl-icd
      amdvlk
      vaapiVdpau
      libvdpau-va-gl
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];

  };      
}