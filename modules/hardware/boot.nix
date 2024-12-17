{ pkgs, config, lib, inputs, ... }:
let 
  amdgpu-kernel-module = pkgs.callPackage ../patches/amdgpu.nix {
    kernel = config.boot.kernelPackages.kernel;
  };
in
{
  imports = [
    inputs.lazaboote.nixosModules.lanzaboote
  ];

  # Boot config
  boot = {
    kernelPackages = pkgs.linuxPackages_6_12;

    # Patch AMDGPU for overlay planes bug
    extraModulesPackages = [
      (amdgpu-kernel-module.overrideAttrs (_: {
        patches = [
          ../patches/test-overlay-planes-pf-fix/0001-drm-amd-display-fix-page-fault-due-to-max-surface-de.patch
          ../patches/test-overlay-planes-pf-fix/0002-drm-amd-display-increase-MAX_SURFACES-to-the-value-s.patch
        ];
      }))
    ];
    
    kernel.sysctl = {
    "kernel.split_lock_mitigate" = 0;

    # Network Optimizations
    "net.core.rmem_max" = 1048576;
    "net.core.wmem_max" = 1048576;
    "net.ipv4.tcp_window_scaling" = 1;
    "net.ipv4.tcp_rmem" = "4096 87380 1048576";
    "net.ipv4.tcp_wmem" = "4096 65536 1048576";
    "net.core.netdev_max_backlog" = 5000;
    "net.ipv4.tcp_congestion_control" = "bbr"; # Example: BBR congestion control
    "net.ipv6.conf.all.disable_ipv6" = 0; # Ensure IPv6 is enabled if needed
    };
    
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchVariables = true;
    };

    lanzaboote = {
      enable = true;
      configurationLimit = 5;
      pkiBundle = "/etc/secureboot";
    };

    bootspec.enable = true;
    initrd = {
      systemd.enable = true;
      verbose = false;
    };
    # Plymouth is purty
    plymouth.enable = true;
  };

  # Swap config
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 30;
  };
  services.udisks2.enable = true;
}
