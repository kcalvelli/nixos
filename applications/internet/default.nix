 { config, pkgs, ... }:

 {

  #programs.captive-browser.enable = true;
  
  environment.systemPackages = with pkgs; [
    brave
    nextcloud-client
    telegram-desktop
    thunderbird
   # discord
    google-chrome
  ]; 

  programs.captive-browser = {
    enable = true;
    interface = "wlp2s0";
    browser = ''brave --user-data-dir=$HOME/.config/brave-captive --proxy-server="socks5://$PROXY" --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE localhost" --no-first-run --new-window --incognito http://cache.nixos.org/'';
  };    
 }
