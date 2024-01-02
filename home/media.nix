{ pkgs, ... }:
{
   home.packages = with pkgs; [ 
     digikam
     vlc
     nextcloud-client
   ];
}