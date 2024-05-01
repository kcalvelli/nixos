{ ... }:
{
  flake.nixosModules = {

    # Core
    nix = ./core/nix.nix;
    users = ./core/users.nix;
    filesystems = ./core/filesystems.nix;
    security = ./core/security.nix;
    fonts = ./core/fonts.nix;
    environment = ./core/environment.nix;

    # Hardware
    boot = ./hardware/boot.nix;    
    system76 = ./hardware/system76.nix;
    msi = ./hardware/msi.nix;
    graphics = ./hardware/graphics.nix;
    sound = ./hardware/sound.nix;

    # Networking
    network = ./network/network.nix;
    bridge = ./network/bridge.nix;
    avahi = ./network/avahi.nix;
    samba = ./network/samba.nix;

    # Services
    hosting = ./services/hosting.nix;
    printing= ./services/printing.nix;   
    virtualisation = ./services/virtualisation.nix;     
    timers = ./services/timers.nix;    
  };
}