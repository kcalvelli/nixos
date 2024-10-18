{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
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

  boot.kernelPackages = pkgs.linuxPackages_6_10;
}
