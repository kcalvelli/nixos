{ ... }:
{
  flake.nixosModules = {
    system76 = ./system76.nix;
    msi = ./msi.nix;
    nix = ./nix.nix;
    hosting = ./hosting.nix;
    users = ./users.nix;
    network = ./network.nix;
    bridge = ./bridge.nix;
    timers = ./timers.nix;
    virtualisation = ./virtualisation.nix;
    filesystems = ./filesystems.nix;
    printing= ./printing.nix;
    security = ./security.nix;
    graphics = ./graphics.nix;
    sound = ./sound.nix;
    fonts = ./fonts.nix;
    boot = ./boot.nix;
    environment = ./environment.nix;
  };
}