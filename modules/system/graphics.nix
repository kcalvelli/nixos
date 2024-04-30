{ ... }:
{
  hardware = {
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

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];  
}