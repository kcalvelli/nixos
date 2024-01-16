{ inputs, config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
     kate
     kcalc
     skanlite
     filelight
     kmail
     korganizer
     merkuro
    ];

  programs.kdeconnect = 
  {
    enable = true;  
  };
}