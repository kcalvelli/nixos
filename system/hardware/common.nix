{ inputs, config, pkgs, ... }:
{
  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
    opengl = {
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        vaapiVdpau
      ];
      driSupport = true;
      driSupport32Bit = true;
    };
    rtl-sdr.enable = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  boot = {

    initrd = {
      # Setup keyfile
      secrets = {
        "/crypto_keyfile.bin" = null;
      };
      systemd.enable = true;
      kernelModules = [ "amdgpu"];
    };

    loader = {
      timeout = 1;
      systemd-boot.enable = true;
      systemd-boot.editor = false;
      grub.enable = false;
    };
  };
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

}