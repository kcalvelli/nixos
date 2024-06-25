{ inputs, pkgs, config, utils, lib, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  #Just cosmic
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  #Disable geoclue
  services.geoclue2.enable = lib.mkForce false;

  environment.systemPackages = with pkgs; [
    adw-gtk3
  ];
}
