{ inputs, pkgs, config, utils, lib, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  #Just cosmic
  services.desktopManager.cosmic.enable = true;

  environment.systemPackages = with pkgs; [
    adw-gtk3
  ];
}
