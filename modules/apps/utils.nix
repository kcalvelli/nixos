{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    stacer
    pavucontrol
    gparted
    mate.caja-with-extensions
    mate.eom
    mate.engrampa    
  ];
}    