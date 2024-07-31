{ inputs, config, pkgs, ... }:
{
  imports = [
    ./pwa.nix
    ./solaar.nix
    ./virtualisation.nix
    ./shell.nix
    ./development.nix
    ./ags.nix
    ./hyprland.nix
    inputs.self.nixosModules.virt.default
  ];

  virt.libvirt.enable = true;
  virt.containers.enable = true;
  
}
