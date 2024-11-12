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
      gaming
      graphics
      msi
      networking
      users
      virt
    ]);

  hardware.msi.enable = true;

  #Virtualisation
  virt.libvirt.enable = true;
  virt.containers.enable = true;

  # Services
  services.caddy-proxy.enable = true;
  services.chatbot.enable = true;

  home-manager.sharedModules = with inputs.self.homeModules; [ workstation ];

  networking = {
    hostName = "edge"; # Define your hostname.
  };
}
