{ ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/31ca4929-c5c0-4a5e-a4e8-d07e18806ced";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-e05489aa-0fc2-4801-a3cc-c0e8498b8fa9".device = "/dev/disk/by-uuid/e05489aa-0fc2-4801-a3cc-c0e8498b8fa9";

  fileSystems."/media/games" = {
    device = "/dev/disk/by-uuid/22d680fd-da6a-49fa-a2e6-3194a925f7ed";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3D0B-6C4A";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };
}
