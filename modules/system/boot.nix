{ ... }:
{
  #Use systemd-boot
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    bootspec.enable = true;

    initrd = {
      systemd.enable = true;
      kernelModules = [ "amdgpu"];  
      verbose = false;  
    };
    # Plymouth is purty
    plymouth.enable = true;
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };
}