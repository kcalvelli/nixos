{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let amdgpu-kernel-module = pkgs.callPackage ./patches/amdgpu.nix {
  kernel = config.boot.kernelPackages.kernel;
};
in 
{
  imports = [
    ./boot.nix
    ./printing.nix
    ./sound.nix
  ];

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableAllFirmware = true;
  };

  boot.kernel.sysctl = {
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

  powerManagement.cpuFreqGovernor = "schedutil";
  # Firmware
  services.fwupd.enable = true;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # boot = {
  #   kernelPackages = 
  #   let
  #      versionNum = "6.12.0-rc7";
  #      linux_6_12_pkg = { fetchurl, buildLinux, ... } @args:
  #       buildLinux (args // {
  #         src = fetchurl {
  #           url = "https://git.kernel.org/torvalds/t/linux-6.12-rc7.tar.gz";
  #           sha256 = "sha256-hYHy81vx++0nGt1a9zz9iMKZorO+RmgRARaYdEPKo2E=";
  #         };
  #         dontStrip = true;
  #         version = versionNum;
  #         modDirVersion = versionNum;
  #       } // (args.argsOverride or { }));
  #     linux_6_12 = pkgs.callPackage linux_6_12_pkg {};
  #   in
  #   pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_6_12);
  #   # Patch AMDGPU for overlay planes bug
  #   extraModulePackages = [
  #     (amdgpu-kernel-module.overrideAttrs (_: {
  #       patches = [
  #         ./patches/overlay-planes-patch_6-12-rc7.patch
  #        ];
  #     }))
  #   ];
  # };
}
