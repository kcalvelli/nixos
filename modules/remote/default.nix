{ config, pkgs, ... }: 
{

  services.xrdp.enable = false;
  services.xrdp.defaultWindowManager = "startplasma-x11";
  services.xrdp.openFirewall = true;

  environment.systemPackages = with pkgs; [
    remmina
  ];
}
