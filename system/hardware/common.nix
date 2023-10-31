{ inputs, config, pkgs, ... }:
{
  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
    opengl = {
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        rocmPackages.clr.icd
        vaapiVdpau
      ];
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
  
  boot = {
    # Kernel
    kernelParams = [op
      "quiet" "iommu=pt" "loglevel=2"   
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