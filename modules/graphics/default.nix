{ pkgs, inputs, ... }:
{
  # Import necessary modules
  imports = [ inputs.nixos-hardware.nixosModules.common-gpu-amd ];

  # Hardware configuration
  hardware = {
    graphics = {
      enable32Bit = true;
      extraPackages = with pkgs; [ rocmPackages.clr.icd ];
    };
  };

  # System packages for graphics
  environment.systemPackages = with pkgs; [
    radeontop
    amdgpu_top
    clinfo
  ];

  # Linux AMDGPU Controller
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
}
