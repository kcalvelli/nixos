 { pkgs, ... }:

 {

  #programs.captive-browser.enable = true;
  # Chrome
  programs.chro
  environment.systemPackages = with pkgs; [
    #brave
    nextcloud-client
    telegram-desktop
   # thunderbird
   # discord
    google-chrome
    neochat
  ]; 
 }
