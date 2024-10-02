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
    amdgpu_top
    clinfo
    pinta
  ];  
  
  # Linux AMDGPU Controller
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
}
