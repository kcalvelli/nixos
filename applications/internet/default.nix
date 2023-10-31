 { config, pkgs, ... }:

 {

  #programs.captive-browser.enable = true;
  
  environment.systemPackages = with pkgs; [
    brave
    nextcloud-client
    telegram-desktop
   # thunderbird
   # discord
    google-chrome
  ]; 
 }
