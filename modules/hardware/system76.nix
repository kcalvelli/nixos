{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.hardware;
in
{
  imports = [
    ./common.nix
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    #inputs.nixos-hardware.nixosModules.system76
  ];

  options = {
    hardware.system76 = {
      enable = lib.mkEnableOption "System76 hardware";
    };
  };

  config = lib.mkMerge [
    ### System76 laptop (Pangolin 12)
    (lib.mkIf cfg.system76.enable {

      boot = {
        kernelParams = [
          "ro"
          "quiet"
          "loglevel=0"
          "splash"
          "systemd.show_status=false"
          "i8042.noaux"
          "nohz_full=1-8"
          "rcu_nocbs=1-8"
        ];
        blacklistedKernelModules = [ "psmouse" ];
        loader.systemd-boot.enable = true;
        initrd.availableKernelModules = [
          "nvme"
          "xhci_pci"
        ];
        kernelModules = [ "kvm-amd" ];
        extraModprobeConfig = ''
          options mt7921_common disable_clc=1
        '';
      };

      # Enable all the system76 stuff
      hardware = {
        system76 = {
          #enableAll = true;
          #kernel-modules.enable = true;
          firmware-daemon.enable = true;
        };
      };

      # Custom build of system76-power
      environment.systemPackages = with pkgs; [
        inputs.self.packages.${pkgs.system}.system76-power
      ];
      services.dbus.packages = [ inputs.self.packages.${pkgs.system}.system76-power ];
      systemd.services.system76-power = {
        description = "System76 Power Daemon";
        serviceConfig = {
          ExecStart = "${inputs.self.packages.${pkgs.system}.system76-power}/bin/system76-power daemon";
          Restart = "on-failure";
          Type = "dbus";
          BusName = "com.system76.PowerDaemon";
      };
        wantedBy = [ "multi-user.target" ];
      };

      # Touchpad support
      services.xserver.synaptics.enable = false;
      services.libinput.enable = true;
    })
  ];
}
