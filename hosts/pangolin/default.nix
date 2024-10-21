{ inputs, pkgs, ... }:

{
  imports =
    [
      ./disks.nix
      inputs.home-manager.nixosModules.default
    ]
    ++ (with inputs.self.nixosModules; [
      system
      desktop
      development
      services
      graphics
      system76
      networking
      users
      virt
    ]);

  hardware.system76.enable = true;

  #Virtualisation
  virt.libvirt.enable = true;
  virt.containers.enable = true;  

  home-manager.sharedModules = with inputs.self.homeModules; [ laptop ];

  networking = {
    hostName = "pangolin"; # Define your hostname.
  };
}
