{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  services.xserver.desktopManager.cosmic.enable = true;
  services.xserver.displayManager.cosmic-greeter.enable = true;
}