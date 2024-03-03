{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  nix.settings = {
    substituters = [ "https://cosmic.cachix.org/" ];
    trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
  };

  services.xserver.desktopManager.cosmic.enable = true;
  services.xserver.displayManager.cosmic-greeter.enable = true;
}