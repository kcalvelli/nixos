{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    gparted
    mate.caja-with-extensions
    mate.eom
    mate.engrampa  
    mission-center
    wlogout  
  ];
}    