 
{ inputs, config, pkgs, ... }:
{
  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
    opengl = {
      extraPackages = with pkgs; [
        rocm-opencl-icd
        rocm-opencl-runtime
        vaapiVdpau
      ];
      driSupport = true;
      #driSupport32Bit = true;
    };
    logitech.wireless.enable = true;
    logitech.wireless.enableGraphical = true;
  };

  boot = {
    # Kernel
    kernelParams = [
      "quiet" "iommu=pt"   
    ];

    initrd = {
      # Setup keyfile
      secrets = {
        "/crypto_keyfile.bin" = null;
      };
      systemd.enable = true;
      kernelModules = [ "amdgpu"];
    };
  };
}
