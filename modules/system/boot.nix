{ pkgs, config, lib, inputs, ... }:
{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  # Boot configuration
  boot = {
    kernelPackages = pkgs.linuxPackages_6_13;

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
      efi.canTouchEfiVariables = true;
    };

    # Enable SecureBoot
    lanzaboote = {
      enable = true;
      configurationLimit = 5;
      pkiBundle = "/var/lib/sbctl";
    };

    bootspec.enable = true;

    # Enable systemd but keep it quiet
    initrd = {
      systemd.enable = true;
      verbose = false;
    };

    # Quiet, pretty startup
    plymouth.enable = true;
    consoleLogLevel = 0;
  };

  # Swap configuration
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 30;
  };

  # Enable UDisks2 service
  services.udisks2.enable = true;
}
