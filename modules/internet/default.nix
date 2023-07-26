 { confiig, pkgs, ... }:

 {
  environment.systemPackages = with pkgs; [
    brave
    nextcloud-client
    telegram-desktop
    thunderbird
  ]; 
    
 }
