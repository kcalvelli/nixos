{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [ 
     digikam
     vlc
     cubicsdr
     spotify
    ];  
}