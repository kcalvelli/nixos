{ ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/bb3c56b8-00a5-44f6-bbe7-1956e5b37c38";
    fsType = "ext4";
  };

  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/22d680fd-da6a-49fa-a2e6-3194a925f7ed";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8371-0372";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/79edb6e5-48e1-4b34-a5a6-c01fd230a4eb"; } ];
}
