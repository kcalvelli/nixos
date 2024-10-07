{ ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/de03ecfb-66a5-46dd-8626-86ed2ba75f73";
    fsType = "ext4";
  };

  fileSystems."/media/games" = {
    device = "/dev/disk/by-uuid/22d680fd-da6a-49fa-a2e6-3194a925f7ed";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/416A-6F8B";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ]
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/d6a6574a-8d5e-492d-ad40-ca7a5718541d"; }
  ];
}
