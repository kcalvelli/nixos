{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    resources
    pavucontrol
    gparted
    mate.caja-with-extensions
    mate.eom
    mate.engrampa    
  ];
}    