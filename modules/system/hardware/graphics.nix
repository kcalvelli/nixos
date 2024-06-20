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
      #amdvlk.enable = true;
      #amdvlk.support32Bit.enable = true;
      loadInInitrd = true;
    };
    graphics = {
      extraPackages = [
        rocmPackages.clr.icd
        #pkgs.amdvlk
      ];
      #extraPackages32 = [
      #  pkgs.driversi686Linux.amdvlk
      #];
    };
    opengl = {
      enable = true;
      driSupport = true;
    };
  };

  ## HIP
  #systemd.tmpfiles.rules = [
  #  "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  #];
}
