 { config, pkgs, ... }:

{
  nixpkgs_cosmic.${pkgs.system}.services.xserver.desktopManager.cosmic.enable = true;
}
 