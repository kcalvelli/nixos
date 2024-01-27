{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
     digikam
     vlc
     cubicsdr
     spotify
    ];  
}